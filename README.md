# RecreateStartMenu
Script to recreate Startmenu from a Template Starmenu

This attempts to fix a deleted startmenu by MS faulty Signature Update

You just put the Icons and folders from the Startmenu from another pc where it wasn't deleted into the folder (so, files from **c:\ProgramData\Microsoft\Windows\Start Menu\Programs** goes into the TemplateStartMenu folder.


![image](https://user-images.githubusercontent.com/42605554/212378641-d3905bb2-4164-4599-a8ab-7b1f8e928e9f.png)

This script then tries to compare the template start menu with the one on the system you are executing the script.
So only lnks for files where the targets exist are copied

This script does incremental runs, so copies only the .lnk files added.

It can right now only be used for lnks under c:\ProgramData\Microsoft\Windows\Start Menu and not for User installs (C:\Users\**user**\AppData\Roaming\Microsoft\Windows\Start Menu\Programs)

## Execution
```powershell
powershell -executionpolicy bypass -file CompareStartMenus.ps1
```

## Use in SCCM
to use this script in SCCM you create a new package

![image](https://user-images.githubusercontent.com/42605554/212377873-b944b526-4e55-4631-9f17-03ae818fee9e.png)

Create a Standard Program
![image](https://user-images.githubusercontent.com/42605554/212377918-2500b987-7eea-4f07-9cb1-5dd0313510b4.png)

Use the command listed under execution 
![image](https://user-images.githubusercontent.com/42605554/212378077-0ef29ed1-a37b-45d1-8d4f-d1bf3f7574cf.png)

![image](https://user-images.githubusercontent.com/42605554/212378182-426d5287-1f36-4a70-bd0f-52fa182df46d.png)

![image](https://user-images.githubusercontent.com/42605554/212378221-3f56c9d3-0ea3-4ebf-8c87-29aafbfdbae5.png)

You can then deploy it to your clients
