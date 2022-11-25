#####
#
# Copyright 2022 Jan Gaida
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
#####
#
# What is this:
#     This is a short powershell-script starting a given exectuable and changing its priority to either
#     IDLE, BELOW_NORMAL, NORMAL, ABOVE_NORMAL, HIGH or REALTIME.
#     Usecase is to create a shortcut to this script with a specified executable and have it start with 
#     given priority.
#
#     Learn more about this here 'https://learn.microsoft.com/en-us/windows/win32/procthread/scheduling-priorities'
#
# How to use:
#     powershell -executionpolicy bypass -file {PATH_TO_THIS_PS1_SCRIPT} "{FULL_PATH_TO_EXECUTABLE}" "{PRIORITY_TARGET}"
#
# Example:
#     powershell -executionpolicy bypass -file C:\Users\jan\Desktop\SetSchedulingPriority.ps1 "notepad.exe" "high"
#
# Requirements:
#     - Powershell v7.3+: Install/Upgrade Powershell with "winget install Microsoft.PowerShell"
#
#####

# Parameter
param(
    [string] $Executable,
    [string] $Piority,
       [int] $Phase
)

# Lifts this script to adminstrator and passes to Phase-1
function Phase-0 {
    #Start-Process powershell -verb runas -ArgumentList "-ExecutionPolicy", "Bypass", "-noexit", "-file", $PSCommandPath, $Executable, $Piority, "1"
    Start-Process powershell -verb runas -ArgumentList "-ExecutionPolicy", "Bypass", "-WindowStyle", "hidden", "-file", $PSCommandPath, $Executable, $Piority, "1"
}

# Executes given executable and changes its priority to specified value
function Phase-1 {
    $Pwd = Split-Path $Executable
    $Executable = Split-Path $Executable -leaf 
    $ProcessName = $Executable.Split(".")[0]
    if (-not [string]::IsNullOrEmpty($Pwd)) {Set-Location $Pwd}
    Start-Process $Executable
    Get-process -processname $ProcessName | foreach {$_.PriorityClass = $Piority}
}

# Call phase
if($Phase -eq 1) {Phase-1}
else {Phase-0}
