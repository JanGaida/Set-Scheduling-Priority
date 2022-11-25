# PS-SetSchedulingPriority

This is a short powershell-script starting a given exectuable and changing its priority to either *IDLE*, *BELOW_NORMAL*, *NORMAL*, *ABOVE_NORMAL*, *HIGH* or *REALTIME*.

Eg. usecase is to create a parameterized shortcut to this script with a specified executable to launch it with given priority-level, without having to either open TaskMgr or CLI.

## How-to-use:

```powershell 
powershell -executionpolicy bypass -file {PATH_TO_THIS_PS1_SCRIPT} "{FULL_PATH_TO_EXECUTABLE}" "{PRIORITY_TARGET}"
```

#### Parameter:
\- *{PATH_TO_THIS_PS1_SCRIPT}* is the full-filepath to the ps-script<br>
\- *{FULL_PATH_TO_EXECUTABLE}* is the full-filepath to the executable to launch<br>
\- *{PRIORITY_TARGET}* is the targeted priority-level


#### Example:

```powershell 
powershell -executionpolicy bypass -file C:\Users\jan\Desktop\Set-Scheduling-Priority.ps1 "notepad.exe" "high"
```

<ins>*Disclaimer:*</ins><br>
When whitespaces in the filepath must be escaped, ie. instead of "C:\Program Files" use "C:\PROGRA~1\..".
