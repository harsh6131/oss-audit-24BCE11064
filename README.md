# OSS Audit Project

- **Student Name:** HARSHVARDHAN SINGH JAISAWAT
- **Roll Number:** 24BCE11064
- **Course:** Open Source Software
- **Chosen Software:** Git (Distributed Version Control)

## Project Overview

This repository is structured for the VITyarthi "Open Source Audit" capstone submission. It contains the five required shell scripts, a report scaffold, and clear run instructions for a Linux system.

## Repository contents

### 1. Script 1: System Identity Report(`_01_system_identity_report.sh`):

- prints Linux distribution, kernel, logged-in user, uptime, date/time, and the license note for the operating system.

### 2. Script 2: FOSS Package Inspector(`02_foss_package_inspector.sh`):
  
- checks whether a package is installed, prints version and license metadata, and shows a short philosophy note with a `case` statement.

### 3. Script 3: Disk and Permission Auditor(`03_disk_permission_auditorsh`):

- audits key Linux directories for size, owner, group, and permissions, then checks Git-related configuration paths.
  
### 4. Script 4: Log File Analyzer(`04_log_file_analyzer.sh`): 
  
- reads a log file line by line, counts keyword matches, retries if the file is empty, and prints the last five matching lines.

### 5. Script 5: Open Source Manifesto Generator(`05_manifesto_generator.sh`): 
asks three interactive questions and generates a personalized open-source manifesto text file.

- `REPORT_SCAFFOLD.md`: a safe outline for the written report so the final report can be completed in the student's own words.

## Linux requirements

- Bash shell
- Core GNU/Linux tools: `uname`, `whoami`, `uptime`, `date`, `du`, `ls`, `awk`, `cut`, `grep`, `tail`
- One package manager present on the system:
  - `dpkg` for Debian/Ubuntu based distributions
  - `rpm` for RHEL/Fedora based distributions
- Optional but useful for Git-focused testing:
  - `git`

## Run instructions

Make scripts executable:

```bash
chmod +x *.sh
```

Run Script 1:

```bash
./01_system_identity_report.sh
```

Run Script 2 with the default package (`git`):

```bash
./02_foss_package_inspector.sh
```

Run Script 2 with a custom package:

```bash
./02_foss_package_inspector.sh firefox
```

Run Script 3:

```bash
./03_disk_permission_auditor.sh
```

Run Script 4 with a log file and optional keyword:

```bash
./04_log_file_analyzer.sh /var/log/syslog error
./04_log_file_analyzer.sh /var/log/messages warning
```

Run Script 5:

```bash
./05_manifesto_generator.sh
```

## Submission checklist

- Keep this repository public before submission.
- Confirm all five `.sh` files are present.
- Confirm this `README.md` is present.
- Generate screenshots of each script running on a real Linux system.
- Complete the report PDF in your own words using `REPORT_SCAFFOLD.md` as the outline.
