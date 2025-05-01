# Cloud SDK and Cloud Shell

**Cloud Shell** – already contains Cloud Shell Editor and is a development-ready environment
- SQL, Kubernetes, Cloud Run, Java, Python already pre-installed
- Google provides 5 GB of persistent storage

---

## Commands:

### `export PS1='$'`
- By default, in Cloud Shell, it includes useful info like your username, hostname, current directory, etc.
- Setting `PS1='$'` removes all that, replacing it with just a plain `$` symbol.

#### Why might someone do this?
- To simplify the prompt, especially for scripting, tutorials, or screenshots
- To reduce clutter or distractions in the terminal prompt

> This change only affects the current session unless added to `.bashrc` or `.bash_profile`

---

### Upload a file
![image](https://github.com/user-attachments/assets/708db177-b18a-47e0-9e2e-71911988bf38)

---

### `ls`
The `ls` command is used to list files.  
- `ls` on its own lists all files in the current directory except for hidden files.

---

### `clear`
Wipes out everything currently on the terminal screen.

---

### `python --version`, `java --version`, `node --version`
Check the version of a package if it’s installed.

---

### `gcloud --version`
Used to interact with different resources.

---

### `gsutil`
`gsutil` is a command-line tool that lets you interact with Google Cloud Storage (GCS).  
- Use `--help` to get a list of available commands  
  Example: `gsutil mb --help`

---

### `gsutil mb gs://your-bucket-name/`
- `mb` stands for **make bucket**  
- Creates a new Cloud Storage bucket

---

### `gcloud auth list`
Check which account is currently active in the CLI.

---

### `gcloud auth login`
Log in to authenticate a Google account for CLI usage.

---

### `gsutil cp 'Customer Journey Map.JPG' gs://olegcuketthroughcli`
Copy a file from the local directory to the specified bucket in Cloud Storage.

---

### `cd`
Change directory.

---

### `cd /tmp/`
Change directory to the temporary directory.  
- Files won’t be persisted here after the session ends.

---

### `nano hello.txt`
Create or edit a file using the nano text editor.
![image](https://github.com/user-attachments/assets/1ae1de21-ac2b-4564-83cc-3c4ebc6106df)

---

### `sudo nano oleg.txt`
Runs the `nano` command as the superuser (root).

---

### `pwd`
Displays the full path of your current directory in the terminal.

---

### `cd ~`
Change directory to your home directory.
![image](https://github.com/user-attachments/assets/c317b3fe-457b-4b8b-9959-a849ef2e8056)
