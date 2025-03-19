# INSTANCE GROUPS 
- Instance Groups are groups of VMs managed as a single instance.

## Two Types:
- **Managed Instance Groups**: Identical VMs created using a template, with features such as autoscaling, auto-healing (detects application failures using health checks), and managed releases. 
  - Can add a Load Balancer to distribute the load among different virtual groups.
  - New versions can be released without downtime.
  
- **Unmanaged Instance Groups**: VMs with different configurations within the same group.
  - No autoscaling, auto-healing, or other advanced features.
  - Not recommended unless you need different VMs.

---

# Cloud Load Balancing
- Cloud Load Balancing is used to distribute traffic across VM instances in one or more regions.
- It is fully managed.
- Supports auto-scaling to handle huge loads.
- Can be private (within a specific network) or public (available on the internet).
- Types of Load Balancers:
  - External HTTP(s)
  - Internal HTTP(s)
  - SSL Proxy
  - TCP Proxy
  - External Network TCP

![image](https://github.com/user-attachments/assets/aa836e45-e33f-4e48-8862-1f4e281994b4)
