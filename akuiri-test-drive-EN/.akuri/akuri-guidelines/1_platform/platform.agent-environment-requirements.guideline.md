---
trigger: always_on
description: Defines the minimum execution environment requirements (local machine or CI/CD) for the Akuri Agent to operate correctly.
status: active
---

# Akuri Agent Execution Environment Requirements

## 1. Purpose

This document defines the minimum technical requirements that any environment (developer machine, continuous integration server, etc.) must meet to ensure the proper functioning of the Akuri Agent.

The Akuri Agent depends on certain standard command-line tools to interact with the file system and execute tasks. The absence of these tools will cause execution failures.

## 2. Minimum Execution Environment Requirements

### 2.1 Shell

-   **Requirement:** A POSIX-compatible shell.
-   **Verification:** `sh` must be available in the system's `PATH`.

### 2.2 Version Control System

-   **Requirement:** Git.
-   **Verification:** The `git` command must be available. Running `git --version` must return a valid version.

### 2.3 Python Interpreter

-   **Requirement:** Python 3.x.
-   **Common Issue:** The agent invokes the interpreter using the `python` command. On many systems, the Python 3 executable is installed as `python3`.
-   **Mandatory Solution:** There must be an executable or symbolic link called `python` in the system's `PATH` that points to a Python 3 installation.

## 3. Verification and Configuration Procedure

Before starting a work session with the Akuri Agent, the user must verify that their environment meets the requirements.

**Python Verification Command:**
```bash
python --version

    Expected Result: Shows a Python 3.x version (e.g. Python 3.9.6).

    If it fails with python: not found: Execute the following commands to create a symbolic link:
    code Bash

    # 1. Find the path of python3
    which python3

    # 2. Create the link (replace the path if different)
    #    May require 'sudo'
    ln -s /usr/bin/python3 /usr/local/bin/python