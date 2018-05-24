#Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Assign Packages to Install
$Packages = 'googlechrome',`
            'visualstudiocode'

#Install Packages
ForEach ($PackageName in $Packages)
{choco install $PackageName -y}

# Install Azure ML Workbench
$Path = $env:TEMP; 
$Installer = "AmlWorkbenchSetup.msi"
Invoke-WebRequest "https://aka.ms/azureml-wb-msi" -OutFile $Path\$Installer
Start-Process -FilePath msiexec -Args "/i $Path\$Installer /quiet /qn /norestart /l C:\Logs\AMLinstall.txt" -Verb RunAs -Wait
Remove-Item $Path\$Installer
