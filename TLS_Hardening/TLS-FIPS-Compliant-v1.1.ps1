<#
.Synopsis
   PS-Script to perform the TLS-FIPS compliance 

.DESCRIPTION
   The following script check the compliance with the security standards like "TLS and FIPS". 


.NOTES
 Name : TLS-FIPS-Compliant.ps1
 Author : Vijay Borkar
 Version : 1.1
#>

#1.Initialization of Directory & File
Function Initialize-Directory {

$Folder = "TLS-FIPS"
$FolderPath = "$($env:USERPROFILE)\Desktop\TLS-FIPS"
$File = "TLSFIPS.csv"
$FilePath = $FolderPath
$Csvheaders = @("Name", "IP-Address")
$TempFolder = Test-Path -Path "$($env:USERPROFILE)\Desktop\TLS-FIPS"
    If(!($TempFolder))
        {
          New-Item -Path "$($env:USERPROFILE)\Desktop" -Name "$Folder" -ItemType Directory
          $Csvheaders| select 'Name', 'IP-Address'| Export-Csv -Path "$($FilePath)\$File" -NoTypeInformation
          Write-Host "Folder named $Folder created on Desktop Successfully" -ForegroundColor Green
          Write-Host "Please Copy-Paste your file in folder$Folder created on Desktop" -ForegroundColor Green
         }Else
              {
                Write-Host "Please Copy-Paste all Server Names in $File in the folder $Folder created on Desktop" -ForegroundColor Green
              }

} 


#2.Retrive list of server names on which the activity is to be performed
$List = Import-Csv -LiteralPath "$($FilePath)\$File"
$ServerList = ($List).name


#3.

$password = read-host -prompt "Enter your Password" 
$secure = ConvertTo-SecureString $password -force -asPlainText 
$bytes = ConvertFrom-SecureString $secure 
$bytes | out-file "$($FilePath)\SecPass.txt" #>



############Getting the credentials Do it only if needed ############
$EncryptedPW = Get-Content -Path "$($FilePath)\SecPass.txt" 
$SecureString = ConvertTo-SecureString -String $EncryptedPW 
$Credentials = New-Object System.Management.Automation.PSCredential "MyUsername", $SecureString
