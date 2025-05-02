# Cloud Shell & Google Cloud SDK Commands Guide

This guide covers essential commands for working with Google Cloud Shell and Google Cloud SDK.

## Terminal Customization

### `export PS1='$'`
Simplifies your command prompt to display just a dollar sign.

* **Default behavior**: Cloud Shell includes username, hostname, and current directory
* **With this command**: Prompt displays only `$`

**Use cases:**
* Creating clean screenshots for documentation
* Recording terminal sessions for tutorials
* Reducing visual clutter during presentations

> **Note**: This change only affects the current session unless added to `.bashrc` or `.bash_profile`

## Basic Terminal Commands

| Command | Description |
|---------|-------------|
| `ls` | Lists files in the current directory (excludes hidden files) |
| `clear` | Clears the terminal screen |
| `cd` | Change directory |
| `cd /tmp/` | Change to temporary directory (files won't persist) |
| `cd ~` | Change to your home directory |
| `pwd` | Print working directory (shows full path of current location) |
| `sudo nano oleg.txt` | Edit a file with superuser (root) privileges |

---

![image](https://github.com/user-attachments/assets/69506551-31eb-45da-87d4-a7b2ed460327)

---
## Version Checking

Check installed software versions:
```bash
python --version
java --version
node --version
gcloud --version
```

## Google Cloud Commands

### Authentication and Project Management

```bash
# Authentication
gcloud auth list     # Show currently authenticated accounts
gcloud auth login    # Login with a new account

# Project Management
gcloud config set project theta-topic-457803-u2    # Set active project
gcloud config unset project                        # Unset active project
gcloud projects list                               # List available projects
gcloud projects create project-from-clioz          # Create a new project
gcloud projects delete project-from-clioz          # Delete a project

```
---

![image](https://github.com/user-attachments/assets/a127aa06-4c4d-474f-a657-80b4418cc644)

---
### Google Cloud Storage (gsutil)

```bash
# Get help
gsutil --help                # List available commands
gsutil mb --help             # Get help for specific command

# Create buckets
gsutil mb gs://bk-cloudsdkoleg                                          # Create bucket (default location)
gsutil mb -p theta-topic-457803-u2 -l us-central1 gs://bk-cloudsdkoleg  # Create bucket with project and location

# Upload files
gsutil cp 'Customer Journey Map.JPG' gs://olegcuketthroughcli           # Upload local file to bucket
gsutil cp C:\Users\zasuk\Pictures\IMG_6390.HEIC gs://bk-cloudsdkoleg    # Upload from Windows path

# Download files
gsutil cp gs://bk-cloudsdkoleg/IMG* C:\Users\zasuk\Downloads            # Download files matching pattern
```

## Command Help

Most commands accept a `--help` flag that provides detailed documentation:

```bash
gsutil --help    # General gsutil help
gsutil mb --help # Specific help for the "make bucket" command
```

> **Pro Tip**: Use tab completion in Cloud Shell to discover available commands and parameters

## Common Operations Workflow

1. Set your project: `gcloud config set project YOUR-PROJECT-ID`
2. Create a bucket: `gsutil mb gs://YOUR-BUCKET-NAME`
3. Upload files: `gsutil cp LOCAL-FILE gs://YOUR-BUCKET-NAME/`
4. List bucket contents: `gsutil ls gs://YOUR-BUCKET-NAME/`
5. Download files: `gsutil cp gs://YOUR-BUCKET-NAME/FILE LOCAL-DESTINATION`
