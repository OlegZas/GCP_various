# Spot VMs in Google Cloud Platform

## Overview
**Spot VMs** (which replaced preemptible VMs) are discounted compute instances on Google Cloud Platform that cost 60-91% less than standard VMs. These VMs utilize Google's excess compute capacity and can be preempted (terminated) with a 30-second notification when Google needs to reclaim the resources.

## When to Use Spot VMs

- **Cost-sensitive workloads**: When budget optimization is a priority
- **Fault-tolerant applications**: For workloads that can handle interruptions
- **Batch processing jobs**: Data analysis, rendering, genomics, CI/CD pipelines
- **Non-critical processing**: Background tasks, development/testing environments
- **Big data processing**: Hadoop, Spark jobs that can restart if interrupted
- **Machine learning training**: Non-urgent ML model training
- **Scalable computing**: When you need to scale out significantly at lower cost

## When to Use Normal VMs

- **Production services**: Customer-facing applications that require stability
- **Continuous availability**: Systems that must maintain high uptime
- **Transactional systems**: Databases, payment processing, or critical API services
- **Stateful applications**: Applications where state cannot be easily recovered
- **Time-sensitive workloads**: Jobs with strict completion deadlines
- **Complex deployments**: Where managing preemption would introduce excessive complexity
- **Compliance requirements**: Workloads with specific uptime or availability SLAs

Spot VMs provide substantial cost savings when your workload can tolerate occasional interruptions, while normal VMs deliver reliability and predictability for business-critical applications.

![image](https://github.com/user-attachments/assets/3f257ad5-73db-429f-9d4c-6de8c38404d2)
