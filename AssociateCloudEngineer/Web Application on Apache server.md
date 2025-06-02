# Simple Web Application on Apache server

When creating a VM, if there are issues accessing the SSH server, most likely it has to do with the firewall rules. Click on the VM and then on the default network. Then check network firewall rules and ensure that the firewall on the VM port (22) allows traffic.

## Modifying a rule if necessary – adding TCP traffic:
![image](https://github.com/user-attachments/assets/c54eac53-d815-41f3-89ac-9032148056b0)

![image](https://github.com/user-attachments/assets/541e7311-e2a6-4272-898c-25034e8e4552)

---

## Then in SSH:

1. Update packages –  
   `sudo apt update`

2. Install Apache –  
   `sudo apt install apache2`
![image](https://github.com/user-attachments/assets/c7dc1885-84f7-4e62-ac3a-173d91e24617)
![image](https://github.com/user-attachments/assets/f77f901d-0905-4021-9898-bf2f3192ce01)

---

## Paste your HTML code:
![image](https://github.com/user-attachments/assets/bac392c7-5ea4-478a-a777-e6fc5779cbf2)

---

## Steps to open, edit, and save `index.html` with nano:

1. In your terminal, type:  
   `sudo nano index.html`  
   and press Enter.

2. This opens the nano editor with the (possibly new or existing) file `index.html`.

3. Now paste or type your HTML code inside the editor.

4. When you’re done editing, to save the file, press:  
   - **Ctrl + O** (the letter O, not zero) — this writes (saves) the file.  
   - It will prompt for the filename (should already show `index.html`), just press **Enter** to confirm.

5. To exit nano, press:  
   - **Ctrl + X**
![image](https://github.com/user-attachments/assets/cab44b42-428b-4725-a11f-44ae5af17e0a)
