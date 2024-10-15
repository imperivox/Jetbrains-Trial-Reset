# JetBrains License Reset Script for Windows

This script facilitates the removal of licensing and configuration settings for JetBrains IDEs on Windows machines. It specifically targets directories and files associated with license management, including registry entries.

## How it Works

### Environment Initialization
- **Command Suppression**: The script starts with `@echo off` to hide command output in the terminal for cleaner execution.
- **Local Environment**: `SETLOCAL` confines any environment changes made by the script, preventing them from impacting the overall system.

### IDE Targeting
- A collection of JetBrains IDE names is established in the `IDE_LIST` variable.

### File and Directory Deletion
- The script scans through each IDE name listed in `IDE_LIST`.
- For every IDE, it searches for matching directories within the user’s profile.
- It checks for the presence of an `eval` folder and an `other.xml` file in the configuration directories.
- If these files are located, they are deleted to remove any license and configuration data.

### Cleaning AppData and Registry
- The script looks for a JetBrains directory in the AppData folder and removes it if found.
- Additionally, it deletes a specific registry key located at `HKEY_CURRENT_USER\Software\JavaSoft`.

### Completion of Script
- The script concludes with **`ENDLOCAL`**, which restores the environment to its initial state, discarding any local changes.

## How to Use
Run the script with admin rights.

## Important Note
Running this script will dramatically change your JetBrains IDE configurations, essentially making them appear as if they were just installed. This may conflict with JetBrains' licensing agreements, so it’s essential to understand the potential consequences and back up any vital information beforehand.
