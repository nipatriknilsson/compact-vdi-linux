# compact-vdi

compactvdi.sh is a simple compact script for VirtualBox VDI harddisk files. It runs in a Linux host a environment.

To successfully use the script, all unused harddisk sectors must be zeroed.

First remove all unnessessary files.

Linux guest run
```
dd if=/dev/zero of=0; rm 0
```

Windows guest (Tested on Windows 10 Guest)
```
sdelete.exe -z
```
From the Sysinternals Suite (https://docs.microsoft.com/en-us/sysinternals/downloads/sysinternals-suite)

An example batch file for Windows is provided as "Cleanup.bat".
