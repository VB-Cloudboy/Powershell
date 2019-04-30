<#
.Synopsis
   PS-Script to Perform RDP Hardening 

.DESCRIPTION
   The following script check and identify the ciphers and enable them, ciphers like;
    - AES 128
	- AES 256
	- Triple DES 168


.NOTES
 Name : RDP_Hardening.ps1
 Author : Vijay Borkar
 Version : 0.1
#>




New-Item -Path HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers -Name "AES 128" -Force
New-Item -Path HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers -Name "AES 256" -Force
New-Item -Path HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers -Name "Triple DES 168" -Force


$path1 = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 256"
$path2 = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\AES 256"
$path3 = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers\Triple DES 168"

$name = "Enabled"

$value = "4294967295"

IF((Test-Path $path1) -eq $true)

   { 
   New-ItemProperty -Path $path1 -Name $name -Value $value -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and enabled"
   }
Else{Write-Output "The Directory does not exist"}

IF((Test-Path $path2) -eq $true)

   { 
   New-ItemProperty -Path $path2 -Name $name -Value $value -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and enabled"
   }
Else{Write-Output "The Directory does not exist"}

IF((Test-Path $path2) -eq $true)

   { 
   New-ItemProperty -Path $path2 -Name $name -Value $value -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and enabled"
   }
Else{Write-Output "The Directory does not exist"}