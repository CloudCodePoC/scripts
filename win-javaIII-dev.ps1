Write-Host This script will download chocolatey and install 
Write-Host software to configure this box for C#
Write-Host 
Write-Host You are about to download https://chocolatey.org/install.ps1
Write-Host Please inspect the URL ^  then confirm or deny installation

#  remove this for hands free install
$yn = Read-Host -Prompt 'Continue Y or N'

if ($yn -ne "y" ) -and ($yn -ne "Y") {
    Write-Host "Aborting"
	Exit-PSSession
	}

$Date = Get-Date -format yyyy-M-d
Write-Host "Config windows on '$Date'" 
$logfile = "install-$Date.log"

#@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat #None -ExecutionPolicy Bypass -Command "iex ((New-Object #System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET #"PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"

Set-ExecutionPolicy Bypass -Scope Process -Force 
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

choco install jdk8  jre8 -y | Out-File  -Append  $logfile
choco install netbeans -y  | Out-File  -Append  $logfile
choco install git -y | Out-File  -Append  $logfile
choco install mysql  mysql.workbench -y | Out-File  -Append  $logfile
choco install maven -y | Out-File  -Append  $logfile

# misc
choco install notepadplusplus atom 7zip -y | Out-File  -Append  $logfile
choco install googlechrome  firefox -y | Out-File  -Append  $logfile

#optional install eclipse & slack
choco install slack -y | Out-File  -Append  $logfile
choco install eclipse-java-neon -y | Out-File  -Append  $logfile
#  oxygen is current versio btw 2017-11

Write-Host Install results in $logfile
