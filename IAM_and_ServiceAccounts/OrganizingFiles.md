# Organizing and Setting up Resources

## Overview

The organization structure for setting up resources in Google Cloud is as follows:

**Organization > Folder > Project > Resources**

Resources are created in **projects**, which exist inside of **folders**, and folders exist within an **organization**.

---

## Best Practices for Organization

- **Create separate folders** for each department.  
- **Create different projects** for **dev** and **prod** environments.  
- **One project per application per environment**.  
  - Example: If you have 2 apps, create 4 projects:  
    - 2 for **dev**  
    - 2 for **prod**
