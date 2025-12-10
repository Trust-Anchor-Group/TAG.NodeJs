Title: Node JS
Master: /Master.md
Cache-Control: max-age=0, no-cache, no-store
UserVariable: User
Privilege: Admin.NodeJS
Login: /Login.md


=========================================================

{{
    path:=GetSetting("NodeJS.Executable.Path", "");
    exeExists:=System.IO.File.Exists(path);

    if Exists(Posted) then (
        if Posted matches { "reinstall": Bool(PReinstall) } and PReinstall then (
            DesiredVersion := "24.11.1";

            SetSetting("NodeJS.Version", "");
            SetSetting("NodeJS.Executable.Path", "");

            WorkDir:=Gateway.AppDataFolder + "packages\\";
            InstallScript:= "& '" + Gateway.AppDataFolder + "Root\\NodeJs\\WinInstall.ps1" + "'";

            Args:=InstallScript + " -DesiredVersion " + DesiredVersion + " -WorkDir '" + WorkDir + "'";
            LogInformational(Args);
            ShellExecute("powershell.sh", Args, WorkDir);

            SetSetting("NodeJS.Version", DesiredVersion);
            SetSetting("NodeJS.Executable.Path", WorkDir + "nodejs\\node.exe");
            ]]
+> Reinstalled
            [[
        )
    )
}}

# Node JS
## Version: {{GetSetting("NodeJS.Version", "not installed")}}
## Path: {{MarkdownEncode(path);}}

{{
    if not exeExists then (
        ]]
> Somthing is wrong with the setup, there is no file at the executable path. Reinstalling might take a few minutes.
After pressing the button just wait until the pages finishes the reload.
            <form method="POST">
                <input name="reinstall" id="reinstall" value="true" hidden>
                <button>Try reinstall</button>
            </form>
        [[
    )
}}