# PS-SetSchedulingPriority

This is a short powershell-script starting a given exectuable and changing its priority to either *IDLE*, *BELOW_NORMAL*, *NORMAL*, *ABOVE_NORMAL*, *HIGH* or *REALTIME*.

Eg. usecase is to create a parameterized shortcut to this script with a specified executable to launch it with given priority-level, without having to either open TaskMgr or CLI.


## Requirements:
\- Windows with Powershell<br>
\- User with access to an administrator-permissions


## How-to-use:

```powershell 
powershell -executionpolicy bypass -file "{PATH_PS1_SCRIPT}" "{PATH_EXECUTABLE}" "{PRIORITY_TARGET}"
```

#### Parameter:
\- *{PATH_PS1_SCRIPT}* is the full-filepath to the ps-script<br>
\- *{PATH_EXECUTABLE}* is the full-filepath to the executable to launch<br>
\- *{PRIORITY_TARGET}* is the targeted priority-level


#### Examples:

```powershell 
powershell -executionpolicy bypass -file C:\Users\jan\Set-Scheduling-Priority.ps1 "notepad.exe" "below_normal"
powershell -executionpolicy bypass -file "C:\Users\jan\Set-Scheduling-Priority.ps1" "C:\PROGRA~1\WindowsApps\Microsoft.WindowsTerminal.exe" "Realtime"
powershell -executionpolicy bypass -file "C:\Users\jan\Set-Scheduling-Priority.ps1" "C:\PROGRA~2\Grinding Gear Games\Path of Exile\PathOfExile.exe" "HIGH"
```


<ins>*Disclaimer:*</ins><br>
\- Whitespaces in the filepaths of the ps-script must be escaped, ie.:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"C:\Program Files\Set-Scheduling-Priority.ps1" --> "C:\PROGRA\~1\\Set-Scheduling-Priority.ps1"<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   "C:\Program Files (x86)\Set-Scheduling-Priority.ps1" --> "C:\PROGRA\~2\\Set-Scheduling-Priority.ps1"<br>
\- Script requires adminstrator-permission to apply 'REALTIME'-Priority.

