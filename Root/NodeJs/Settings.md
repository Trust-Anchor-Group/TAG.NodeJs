Title: Node JS
Master: /Master.md
Cache-Control: max-age=0, no-cache, no-store
UserVariable: User
Privilege: Admin.NodeJS
Login: /Login.md


=========================================================

{{
    path:=GetSetting("nodejs_executable_path", "");
    exeExists:=System.IO.File.Exists(path);

    if Exists(Posted) then (
        if Posted matches { "reinstall": Bool(PReinstall) } and PReinstall then (
            DesiredVersion := "24.11.1";

            SetSetting("nodejs_current_version", "");
            SetSetting("nodejs_executable_path", "");

            WorkDir:=Gateway.AppDataFolder + "packages\\";
            InstallScript:= "& '" + Gateway.AppDataFolder + "Root\\NodeJs\\WinInstall.ps1" + "'";

            Args:=InstallScript + " -DesiredVersion " + DesiredVersion + " -WorkDir '" + WorkDir + "'";
            LogInformational(Args);
            ShellExecute("powershell.sh", Args, WorkDir);

            SetSetting("nodejs_current_version", DesiredVersion);
            SetSetting("nodejs_executable_path", WorkDir + "nodejs\\node.exe");
            ]]
+> Reinstalled
            [[
        )
    )
}}

# Node JS
## Version: {{GetSetting("nodejs_current_version", "not installed")}}
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