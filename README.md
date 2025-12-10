# Node JS

Free package which installes Node JS version 24.11.1 on the running [TAG Neuron(R)](https://lab.tagroot.io/Documentation/Index.md) at $AppDataFolder/Packages/nodejs/node.exe

## Installable Package 

The Node JS installer has been made into a package that can be downloaded and installed on any 
[TAG Neuron](https://lab.tagroot.io/Documentation/Index.md). To create a package, that can be distributed or installed, you begin by creating 
a *manifest file*. This repository contains a manifest file called `TAG.NodeJs.manifest`. It defines the content files included in the package. 
You then use the `Waher.Utility.Install` and `Waher.Utility.Sign` command-line tools in the [IoT Gateway](https://github.com/PeterWaher/IoTGateway) 
repository, to create a package file and cryptographically sign it for secure distribution across the Neuron network.

The Node JS installer is published as a package on TAG Neurons. If your Neuron is connected to this network, you can install the
package using the following information:

| Package information                                                                                                              ||
|:-----------------|:---------------------------------------------------------------------------------------------------------------|
| Package          | `TAG.Nodejs.package`                                                                                           |
| Installation key | `aKY7N1VcoNeDvWXRTyLSoP1ZmrkPkIrh6nIgffiOrjM9Ix+qkT9C7lWn8O2NCcZ/PmuSO9T6S/uA1535b7c39de3bfd6f8f762ce76c92053` |
| More Information |                                                                                                                |

## Usage

The package does not set the machines PATH enviorment variable to enable use of 

> node index.js

in a terminal, you have to sepcify the full path (eg: C:/Program Data/IoT Gateway/Packages/nodejs/node.exe) or 
use the runtime setting using web script (.ws)
> exec := GetSetting("NodeJS.Executable.Path", "");  
> ShellExecute(exec, "index.js", "");

or in c#
> string ExecPath = await RuntimeSettings.GetAsync("NodeJS.Executable.Path", string.Empty);

## Settigns Page

The settings page is `/NodeJs/Settings.md`.