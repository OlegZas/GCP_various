# Bare Metal in the Cloud

## Virtualization
- One host computer supports multiple guest VMs.
  - **Compute Engine** is an example of virtualization.
  - **Hypervisor** – software, on top of the hardware, that creates and runs VMs.
    - Creates 5-10% overhead tax in performance.

### If you need ultra-high performance:
- **Bare Metal**: hardware without any software pre-installed.
- GCP provides customizable and dedicated hardware without a hypervisor.
  - You choose the OS.
  - You are responsible for all software, licensing, and maintenance.

### Use cases:
- When you want to make use of 3rd party virtualization software (not Compute Engine).
- When you have applications that need direct low-level access to the server, like **SAP HANA**.


