---

trigger: model_decision

description: Guide for compatible terminal use in file and directory creation operations in Akuri environments, focused on universal commands for Windows, Linux, and macOS, avoiding shell-specific syntax for maximum portability.

status: active

linked_files: [] # No Akuri documents directly linked in this case are identified.

use_case: BUILD, DESIGN, PLAN # Relevant when building structures, designing folders, or planning operations.

---

# Guide for Multiplatform Terminal Operations (akuri-terminal.cross-platform-terminal-operations.guideline.md)

## 1. Introduction and Purpose

This document provides essential guidelines for terminal interaction in creating file and directory structures within any Akuri Methodology project. Its fundamental purpose is to ensure **multiplatform compatibility** and **operational security**, guaranteeing that commands work consistently in environments such as VSCode, Windows (PowerShell/WSL), Linux, and macOS.

**YOU** must prioritize simplicity and universality of commands, avoiding shell-specific syntax that may generate inconsistencies or failures in different operating systems.

## 2. Structure and General Principles

### 2.1 Fundamental Principles for Terminal Operations

*   **Multiplatform Compatibility:**
    *   **Avoid Bash-specific syntax:** Do not use brace expansions (`{dir1,dir2}`) or advanced `globbing` features (`**/*.ts`) that are not universal.
    *   **Individual and Explicit Commands:** Create directories and files one by one or in clear and atomic sequences.
    *   **Standard Paths:** Use forward slashes (`/`) for paths, as they are compatible with Windows (PowerShell), Linux, and macOS.

*   **Safe Operations:**
    *   **Verify Before Executing:** Always confirm the current directory (`pwd`) and the possible impact of a command before executing it.
    *   **Clear Relative Paths:** Prefer the `./` prefix for relative paths to avoid ambiguities.
    *   **Avoid Uncontrolled Destructive Operations:** Extreme caution with commands like `rm`, `del`, or any overwriting operation.

### 2.2 Structure of this Guideline

1.  Introduction and Purpose
2.  Structure and General Principles
3.  Guide for Directory Creation
4.  Guide for File Operations
5.  Guide for Navigation
6.  Best Practices in Command Execution
7.  Environment-Specific Considerations
8.  Common Patterns to Avoid
9.  Recommended Workflow
10. Examples in Context
11. Migration of Old Patterns
12. Conclusion

## 3. Guide for Directory Creation

### 3.1 ❌ Incorrect Approaches (To Avoid)

```bash
# DO NOT USE: Bash brace expansion (not compatible in all environments, e.g., CMD in Windows)
mkdir -p backend-nest/src/subsytem/product/product-presentation/{controllers,services,models/{dto,response,enums},data}

# DO NOT USE: Complex nesting of commands that may hide failures
mkdir -p dir1 && mkdir -p dir1/subdir1 && mkdir -p dir1/subdir2



3.2 ✅ Correct Approaches (Recommended)
Method 1: Sequential and Explicit Commands

This method is the most compatible and easy to debug.
code Bash

    
# 1. Create the main base directory
mkdir -p backend-nest/src/subsytem/product/product-presentation

# 2. Then, create the subdirectories one by one
mkdir -p backend-nest/src/subsytem/product/product-presentation/controllers
mkdir -p backend-nest/src/subsytem/product/product-presentation/services
mkdir -p backend-nest/src/subsytem/product/product-presentation/models
mkdir -p backend-nest/src/subsytem/product/product-presentation/models/dto
mkdir -p backend-nest/src/subsytem/product/product-presentation/models/response
mkdir -p backend-nest/src/subsytem/product/product-presentation/models/enums
mkdir -p backend-nest/src/subsytem/product/product-presentation/data

  

Method 2: Use of Scripts (Recommended for Complex and Repeatable Structures)

For complex structures or those that are frequently repeated (e.g., when creating new modules or components), encapsulating the logic in a Shell script (.sh or .ps1 for PowerShell) improves maintainability and compatibility.
code Bash

    
# Example Script for Bash/Zsh (ensure compatibility with `sh` for Windows/WSL)
# Save as create_dirs.sh
cat > create_dirs.sh << 'EOF'
#!/bin/sh
# Directory structure creation script for the product-presentation module

BASE_DIR="backend-nest/src/subsytem/product/product-presentation"

# Create the main base directory
mkdir -p "$BASE_DIR"

# Create subdirectories individually
mkdir -p "$BASE_DIR/controllers"
mkdir -p "$BASE_DIR/services"
mkdir -p "$BASE_DIR/models" # Ensure 'models' exists before its subdirectories
mkdir -p "$BASE_DIR/models/dto"
mkdir -p "$BASE_DIR/models/response"
mkdir -p "$BASE_DIR/models/enums"
mkdir -p "$BASE_DIR/data"

echo "Directory structure successfully created in: $BASE_DIR"
EOF

# Make the script executable and run it
chmod +x create_dirs.sh
./create_dirs.sh

  

Method 3: Graphical Interface (VSCode/Cursor File Explorer)

For punctual tasks or less repetitive structures, using the IDE's file explorer graphical interface (VSCode or Cursor) is a safe and compatible option.

    Navigate to the desired directory in the file explorer.

    Right-click → "New Folder" for each necessary directory.

    This ensures compatibility and provides visual confirmation.

4. Guide for File Operations
4.1 File Creation
code Bash

    
# ✅ Correct: Create files individually
touch backend-nest/src/subsytem/product/product-presentation/product-presentation.module.ts

# ❌ Incorrect: Creation of multiple files at once (may not work in all shells or versions)
touch file1.ts file2.ts file3.ts

  

4.2 File Permissions

Always set permissions explicitly when necessary, especially for scripts.
code Bash

    
# ✅ Correct: Set permissions explicitly and understandably
chmod 644 script.sh  # Read/write for owner, read-only for others
chmod 755 script.sh  # Execute permission for all users

# ❌ Incorrect: Assume default permissions that may not be desired or secure

  

5. Guide for Navigation
5.1 Directory Changes
code Bash

    
# ✅ Correct: Use absolute paths when possible to avoid ambiguities
cd /full/path/to/project/backend-nest

# ✅ Correct: Use relative paths with verification
cd ./backend-nest
pwd # Verify current location after a change

# ❌ Incorrect: Assume current location without verification, may lead to errors
cd backend-nest # Could fail if not in the expected directory

  

5.2 Path and Existence Verification

Always verify location and existence of elements before performing critical operations.
code Bash

    
# Always verify current location before any operation
pwd
ls -la # List current directory contents

# Verify if a directory exists before trying to create it or interact with it
if [ ! -d "backend-nest/src" ]; then
    echo "Error: The directory 'backend-nest/src' does not exist."
    exit 1
fi

  

6. Best Practices in Command Execution
6.1 Error Handling

Ensure commands handle possible failures to avoid unexpected executions.
code Bash

    
# ✅ Correct: Verify command success and react to failures
mkdir -p some/dir || echo "Error: Failed to create directory 'some/dir'."

# ✅ Correct: Use '&&' to chain commands that depend on the success of the previous one
mkdir -p some/dir && cd some/dir && echo "Directory created and navigated successfully."

  

6.2 Command Chaining

Keep command chains simple and clear.
code Bash

    
# ✅ Correct: Simple chaining with a clear purpose
cd backend-nest && npm install

# ❌ Incorrect: Complex chains that may hide errors in intermediate steps
cd backend-nest && npm install && npm run build && npm test
# (It's better to divide this into separate steps with verifications)

  

6.3 Long Commands

Improve readability of long commands.
code Bash

    
# ✅ Correct: Split long commands using backslash for better readability
npm run command \
    --param1 value1 \
    --param2 value2 \
    --another-option

# ✅ Correct: Use variables for complex and reusable commands
COMMAND="npm run build --prod --output-path=dist"
eval "$COMMAND" # 'eval' executes the variable content as a command

  

7. Environment-Specific Considerations
7.1 Windows Compatibility

    Forward Slashes in Paths: Always use forward slashes (/) in paths (e.g., /c/projects/backend-nest). This works in both Unix-type shells (Git Bash, WSL) and PowerShell.

    Avoid Unix-Specific Commands:

        ❌ Incorrect: grep, sed, awk (may not be available in default Windows installations).

        ✅ Correct: Use Node.js-based alternatives (scripts), Python, or PowerShell tools for text manipulation.

7.2 Integration with VSCode/Cursor Terminal

    Clear Output: Commands are executed in the integrated terminal. Ensure output messages are clear and descriptive, as output may be captured or filtered by the IDE.

    Avoid Interactive Commands: Prefer non-interactive versions of commands that require user input, as interaction may be uncomfortable or incompatible with automation.

8. Common Patterns to Avoid
8.1 Bash-Specific Features

    ❌ Brace expansion: echo {1..5}

    ❌ Command substitution with backticks: `command` (prefer $(command) if strictly necessary and compatibility is verified).

    ❌ Advanced globbing: ls **/*.ts (not universal).

8.2 Unix-Only Commands

    ❌ May not work in Windows: grep "pattern" file.txt, sed 's/old/new/' file.txt, awk '{print $1}' file.txt.

    ✅ Multiplatform alternatives: Use Node.js/Python scripts for file manipulation, or WSL environment in Windows.

8.3 Interactive Commands

    ❌ Commands that expect user input: git commit (without -m flag), npm init (interactive mode).

    ✅ Non-interactive alternatives: git commit -m "message", npm init --yes.

9. Recommended Workflow
9.1 For Directory Structure Creation

    Plan the Structure: Outline the desired directory structure (in a text file, comments, or mentally).

    Create Parent Directories: Use mkdir -p to create the main parent directories.

    Create Subdirectories Sequentially: Create subdirectories level by level or individually.

    Verify Creation: Use ls -la or the IDE's file explorer to confirm the structure.

    Create Files: Create files individually as needed.

9.2 For Complex and Repeatable Operations

    Write a Script: Develop a script (.sh or .ps1) to encapsulate logic for complex or repeatable operations.

    Test the Script: Run the script in a safe environment and verify its behavior on all target platforms (if possible).

    Document the Script: Add clear comments to the script explaining its purpose, parameters, and any special considerations.

    Version Control: Keep scripts under version control (git) along with the project code.

10. Examples in Context
10.1 Module Structure Creation (Recommended Approach)

This example shows the creation of a product-offer module using the sequential method.
code Bash

    
# 1. Navigate to project root
cd /path/to/project

# 2. Create the new module's base directory
mkdir -p backend-nest/src/subsytem/product/product-offer

# 3. Create subdirectories sequentially
mkdir -p backend-nest/src/subsytem/product/product-offer/controllers
mkdir -p backend-nest/src/subsytem/product/product-offer/services
mkdir -p backend-nest/src/subsytem/product/product-offer/models
mkdir -p backend-nest/src/subsytem/product/product-offer/models/dto
mkdir -p backend-nest/src/subsytem/product/product-offer/models/response
mkdir -p backend-nest/src/subsytem/product/product-offer/models/enums
mkdir -p backend-nest/src/subsytem/product/product-offer/data

# 4. Verify the created structure
ls -la backend-nest/src/subsytem/product/product-offer/

  

10.2 Safe File Operations
code Bash

    
# 1. Create files individually
touch backend-nest/src/subsytem/product/product-offer/product-offer.module.ts
touch backend-nest/src/subsytem/product/product-offer/controllers/product-offer.controller.ts
touch backend-nest/src/subsytem/product/product-offer/services/product-offer.service.ts

# 2. Verify the results
ls -la backend-nest/src/subsytem/product/product-offer/controllers/
ls -la backend-nest/src/subsytem/product/product-offer/services/

  

11. Migration of Old Patterns

If YOU, or a user, find scripts or documentation that use incompatible patterns (e.g., Bash-specific syntax):

    Identify Problematic Commands: Recognize script parts that use non-multiplatform syntax.

    Replace with Individual Operations: Substitute problematic commands with sequential or script-based alternatives that comply with these guidelines.

    Test on Target Platforms: Run the updated script or commands on different platforms (Windows, Linux, macOS) to confirm correct operation.

    Update Documentation: Ensure any documentation or guideline referencing these patterns is also updated.

12. Conclusion

Following these guidelines ensures terminal operations are consistent and reliable in all Akuri development environments. When in doubt, YOU must prefer simple and individual commands over complex or shell-specific syntax. YOU must always test commands in the target environment before relying on them in scripts or documentation.

Reminder: The goal is to achieve reliable and maintainable operations that work for the entire development team, not clever shortcuts that are only functional on specific systems.