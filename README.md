\# Windows Server Master VM Workflow



> Hyper-V Windows Server 2016 master VM setup, upgrade to 2022, Sysprep, and snapshot workflow.



\## 1️⃣ VM Configuration



| Resource | Minimum | Recommended |

|----------|---------|-------------|

| RAM      | 4 GB    | 6–8 GB      |

| CPU      | 2 vCPU  | 4 vCPU      |

| Disk     | 60 GB   | 80–100 GB   |

| Disk Type| Dynamic | Dynamic / Differencing (for multiple VMs) |



\## 2️⃣ Steps



1\. Create a new VM in Hyper-V.

2\. Install Windows Server 2016 and required roles/features.

3\. Apply updates and test VM.

4\. Upgrade to Windows Server 2022.

5\. Run Sysprep with: `/oobe /generalize /shutdown`.

6\. Take a snapshot or create a master image.



\## 3️⃣ PowerShell Script



See `scripts/create-vm.ps1` for automation example.



