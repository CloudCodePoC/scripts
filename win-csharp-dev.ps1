Write-Host This script will download chocolatey and install 
Write-Host software to configure this box for Android Development
Write-Host Afterward you will need to install necessary SDKs & AVDs via Android Studio
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

choco install visualstudio2017professional
choco install dotnet4.7.1  # should be dotnetcore maybe?
choco install git

# misc
choco install notepadplusplus atom 7zip -y | Out-File  -Append   $logfile
choco install firefox  -y  | Out-File  -Append   $logfile

# optional install dropbox & slack
choco install dropbox  -y  | Out-File  -Append   $logfile
choco install slack  -y  | Out-File  -Append   $logfile

Write-Host Install results in $logfile
