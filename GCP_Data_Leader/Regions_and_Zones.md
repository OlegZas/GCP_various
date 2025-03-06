# GCP Walkthrough Notes

## Regions
A **region** is a single geographical location where your BigQuery dataset is stored (e.g., `us-central1`, `europe-west1`).

### Challenges of a Single Data Center in One Region:
1. **High latency** – Slow access for users from other parts of the world.
2. **Single point of failure** – If the data center crashes, no one will have access.
3. **Regional failure** – If the entire region goes down, all services in that region are unavailable.

### Solutions:
- **Challenge 1:** Add another data center within the region.
- **Challenge 3:** Deploy a data center in another region.
- **Challenge 1 (partially solved):** Deploying in another region helps decrease latency.

## Zones
In **Compute Engine** or **Cloud Storage**, a "zone" is a subdivision of a region (e.g., `us-central1-a`, `us-central1-b`).

![image](https://github.com/user-attachments/assets/2500a1f3-0308-4451-b93e-322acb40c798)

---

![image](https://github.com/user-attachments/assets/5358044a-de3d-4d0b-be14-e1b999dc92d6)

---

![image](https://github.com/user-attachments/assets/f7811314-fac9-40c6-80a5-9692b70767e4)
