# Setup Dev Boxes

Before using these scripts spin up a Windows VM image on any of the cloud providers.
Or use them on local Windows Operating Systems installs.
* Google Cloud Engine (CE)
* Amazon Elastice Compute Cloud (AWS EC2)
* Azure Compute VM 
* etc.

All scripts are intended as a starting point, you may add or remove what you wish.

## Windows configuration powershell scripts

Chocolatey is the package management software that should have been distributed with
windows from the beginning.  It is a less complete version of the package managers  
found in Linux distributions.    

All of these scripts first confirm that they are to be run.  Then they download and 
install [Chocolatey](https://chocolatey.org/install) Please inspect the 
[installation script](https://chocolatey.org/install.ps1) for chocolatey before
proceeding with  the scripts.   

Download one of these scripts and run it in a powershell

* [Android Dev](win-android-dev.ps1)
* [Java+MySql Dev](win-javaIII-dev.ps1)
* [CSharp Dev](win-csharp-dev.ps1)
