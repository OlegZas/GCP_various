# Using a VM as a Proxy to Access Websites

You can route your local browser traffic through a virtual machine (VM) to browse the internet as if you're located at the VM's IP address.

## 1. Set Up a SOCKS Proxy

Run the following command to create a SOCKS proxy through your VM:

    ssh -D 1080 -N -f <USERNAME>@<VM_EXTERNAL_IP>

> Replace `<USERNAME>` and `<VM_EXTERNAL_IP>` with your actual VM SSH username and external IP.
![image](https://github.com/user-attachments/assets/0b67b06b-e173-48ed-8692-1f91df508dd8)

### Example

    ssh -D 1080 -N -f olegphotos1@34.60.58.221

This only needs to be done once to start the proxy.

---

## 2. Configure Your Local Browser (e.g., Chrome)

### ✅ Option 1: Use Chrome Command Line (Quickest for Testing)

On **Windows**, run via CMD or update a shortcut target with the following:

    chrome.exe --proxy-server="socks5://localhost:1080"

📝 **To stop using the proxy**, simply close Chrome and reopen it normally.

If everything is set up correctly, visiting a site like [https://whatismyipaddress.com](https://whatismyipaddress.com) should display your VM’s IP (e.g., `34.60.58.221`).

---

## 3. Alternative: Use Google Cloud SDK Shell

If you're using the **Google Cloud SDK Shell**, run:

    ssh -i %HOMEPATH%\.ssh\google_compute_engine -D 1080 -N olegphotos1@34.60.58.221

### Launch Chrome in Incognito with Proxy Profile

    "C:\Program Files\Google\Chrome\Application\chrome.exe" ^
      --proxy-server="socks5://localhost:1080" ^
      --user-data-dir="C:\temp\chrome-proxy-profile" ^
      --incognito

> The `--user-data-dir` flag ensures this session uses a separate Chrome profile, avoiding interference with your default session.
