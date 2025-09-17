# ==============================
# Hyper-V Master VM Setup Script
# ==============================
# Windows Server 2016 setup -> Upgrade -> Sysprep -> Snapshot

# 1️⃣ VM Parameters
$VMName = "WSMaster"
$VMMemoryStartupBytes = 6GB
$VMCPU = 2
$VHDSizeBytes = 80GB
$VHDPath = "C:\HyperV\VHDs\$VMName.vhdx"
$SwitchName = "ExternalSwitch" # Hyper-V external switch
$ISOPath = "C:\ISOs\WindowsServer2016.iso"

# 2️⃣ Create VM
New-VM -Name $VMName -MemoryStartupBytes $VMMemoryStartupBytes -Generation 2 -SwitchName $SwitchName
Set-VMProcessor -VMName $VMName -Count $VMCPU

# 3️⃣ Create Disk (Dynamic)
New-VHD -Path $VHDPath -SizeBytes $VHDSizeBytes -Dynamic
Add-VMHardDiskDrive -VMName $VMName -Path $VHDPath

# 4️⃣ Mount ISO and start VM
Set-VMDvdDrive -VMName $VMName -Path $ISOPath
Start-VM -Name $VMName

Write-Host "VM started. Please complete Windows Server 2016 installation and updates."

# --- Upgrade and Sysprep steps are manual ---
# 1. Upgrade Server 2016 to Server 2022
# 2. Clean unnecessary files on the VM
# 3. Run Sysprep:
#    & C:\Windows\System32\Sysprep\Sysprep.exe /oobe /generalize /shutdown

# 5️⃣ Take Snapshot
$SnapshotName = "WSMaster_MasterImage"
Checkpoint-VM -Name $VMName -SnapshotName $SnapshotName

Write-Host "Master snapshot taken: $SnapshotName"
