* This code literally takes a screeenshot of any given webpage and sets it as the desktop background.
* If you want to automate this process and update the wallpaper every few hours you can easily add the bat file to the task scheduler.
* More details about the code and some customization options can be found in the 'earthnull.js' file. 
* This code has been tested on a Windows 10 PC. You will need administrator privileges to run the 'run.bat' file.
* Feel free to use this code however you want.

Troubleshooting
* For those who are getting an execution policy error, it's because you haven't granted PowerShell permission to run local scripts. The simplest way to fix this is to:
	* Start powershell as administrator
	* Run the following command: Set-ExecutionPolicy RemoteSigned
* Try moving the folder to a local drive on the computer.
* If phantomJS is not updating your picture - edit the earthNullWallpaper.ps1 file and change $argpath variable.
- u/rdx313