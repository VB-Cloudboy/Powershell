<#
.Synopsis
   PS-Script to Perform RDP Hardening 

.DESCRIPTION
   The following script check and identify the ciphers and accordingly enables and disables them 
   as per the requirement.


.NOTES
 Name : RDP_Hardening.ps1
 Author : Vijay Borkar
 Version : 0.3
#>




## Create New Directory under Cipher ##
$CipherPath = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Ciphers"
$CipherKey = "$CipherPath\AES 128\","$CipherPath\AES 256\","$CipherPath\Triple DES 168\" 
New-Item -ItemType Directory $CipherKey

## Create New Directory under Hashes ##
$HashesPath = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Hashes"
$HashesKey = "$HashesPath\SHA\","$HashesPath\SHA256\","$HashesPath\SHA384\","$HashesPath\SHA512\"
New-Item -ItemType Directory $HashesKey

## Create New Directory under KeyExchangeAlgorithms ##
$KEApath = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\KeyExchangeAlgorithms"
$KEAkey = "$KEApath\Diffie-Hellman\","$KEApath\ECDH\","$KEApath\PKCS\"
New-Item -ItemType Directory $KEAkey

## Create New Directory under Protocols ##
$ProtocolPath = "HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\SCHANNEL\Protocols"
$ProtocolKey = "$ProtocolPath\SSL 2.0\","$ProtocolPath\SSL 2.0\Client\","$ProtocolPath\SSL 2.0\Server\","$ProtocolPath\SSL 3.0\","$ProtocolPath\SSL 3.0\Client\","$ProtocolPath\SSL 3.0\Server",`
               "$ProtocolPath\TLS 1.0\","$ProtocolPath\TLS 1.0\Client\","$ProtocolPath\TLS 1.0\Server","$ProtocolPath\TLS 1.1\","$ProtocolPath\TLS 1.1\Client","$ProtocolPath\TLS 1.1\Server",`
               "$ProtocolPath\TLS 1.2\","$ProtocolPath\TLS 1.2\Client","$ProtocolPath\TLS 1.2\Server"
New-Item -ItemType Directory $ProtocolKey

######################################################################
## Defining DWORD ##
$dword01 = "DisabledByDefault"
$dword02 = "Enabled"
$value01 = "1"
$value02 = "4294967295"
$value03 = "0"

######################################################################

## Defining Cipher Directory ##
$CipherDirAES128 = "$CipherPath\AES 128\"
$CipherDirAES256 = "$CipherPath\AES 256\"
$CipherDirDES168 = "$CipherPath\Triple DES 168\"

#######################################################################

## Conditions for Cipher ##

IF((Test-Path $CipherDirAES128) -eq $true)

   { 

   New-ItemProperty -Path $CipherDirAES128 -Name $dword02 -Value $value02 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

IF((Test-Path $CipherDirAES256) -eq $true)

   { 

   New-ItemProperty -Path $CipherDirAES256 -Name $dword02 -Value $value02 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

IF((Test-Path $CipherDirDES168) -eq $true)

   { 

   New-ItemProperty -Path $CipherDirDES168 -Name $dword02 -Value $value02 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

########################################################################

## Defining Hashes Directory ##
$HashesDirSHA = "$HashesPath\SHA\"
$HashesDirSHA256 = "$HashesPath\SHA256\"
$HashesDirSHA384 = "$HashesPath\SHA384\"
$HashesDirSHA512 = "$HashesPath\SHA512\"

########################################################################

## Conditions for Hashes ##

IF((Test-Path $HashesDirSHA) -eq $true)

   { 

   New-ItemProperty -Path $HashesDirSHA -Name $dword02 -Value $value02 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

IF((Test-Path $HashesDirSHA256) -eq $true)

   { 

   New-ItemProperty -Path $HashesDirSHA256 -Name $dword02 -Value $value02 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

IF((Test-Path $HashesDirSHA384) -eq $true)

   { 

   New-ItemProperty -Path $HashesDirSHA384 -Name $dword02 -Value $value02 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

IF((Test-Path $HashesDirSHA512) -eq $true)

   { 

   New-ItemProperty -Path $HashesDirSHA512 -Name $dword02 -Value $value02 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

####################################################################################

## Defining KeyExchangeAlgorithms Directory ##
$KEADirDH = "$KEApath\Diffie-Hellman\"
$KEADirECDH = "$KEApath\ECDH\"
$KEADirPKCS = "$KEApath\PKCS\"

#####################################################################################

## Conditions for KeyExchangeAlgorithms ##

IF((Test-Path $KEADirDH) -eq $true)

   { 

   New-ItemProperty -Path $KEADirDH -Name $dword02 -Value $value02 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

IF((Test-Path $KEADirECDH) -eq $true)

   { 

   New-ItemProperty -Path $KEADirECDH -Name $dword02 -Value $value02 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

IF((Test-Path $KEADirPKCS) -eq $true)

   { 

   New-ItemProperty -Path $KEADirPKCS -Name $dword02 -Value $value02 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

############################################################################################

## Defining Protocols Directory ##

$ProtocolDirS2C = "$ProtocolPath\SSL 2.0\Client\"
$ProtocolDirS2S = "$ProtocolPath\SSL 2.0\Server\"


$ProtocolDirS3C = "$ProtocolPath\SSL 3.0\Client\"
$ProtocolDirS3S = "$ProtocolPath\SSL 3.0\Server\"


$ProtocolDirT10C = "$ProtocolPath\TLS 1.0\Client\"
$ProtocolDirT10S = "$ProtocolPath\TLS 1.0\Server\"


$ProtocolDirT11C = "$ProtocolPath\TLS 1.1\Client\"
$ProtocolDirT11S = "$ProtocolPath\TLS 1.1\Server\"


$ProtocolDirT12C = "$ProtocolPath\TLS 1.2\Client\"
$ProtocolDirT12S = "$ProtocolPath\TLS 1.2\Server\"

###########################################################################################

## Conditions for Protocols ##

IF((Test-Path $ProtocolDirS2C) -eq $true)

   { 

   New-ItemProperty -Path $ProtocolDirS2C -Name $dword02 -Value $value03 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

IF((Test-Path $ProtocolDirS2S) -eq $true)

   { 

   New-ItemProperty -Path $ProtocolDirS2S -Name $dword01 -Value $value03 -PropertyType DWORD -Force
   New-ItemProperty -Path $ProtocolDirS2S -Name $dword02 -Value $value03 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

IF((Test-Path $ProtocolDirS3C) -eq $true)

   { 

   New-ItemProperty -Path $ProtocolDirS3C -Name $dword01 -Value $value03 -PropertyType DWORD -Force
   New-ItemProperty -Path $ProtocolDirS3C -Name $dword02 -Value $value03 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

IF((Test-Path $ProtocolDirS3S) -eq $true)

   { 

   New-ItemProperty -Path $ProtocolDirS3S -Name $dword01 -Value $value03 -PropertyType DWORD -Force
   New-ItemProperty -Path $ProtocolDirS3S -Name $dword02 -Value $value03 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

IF((Test-Path $ProtocolDirT10C) -eq $true)

   { 

   New-ItemProperty -Path $ProtocolDirT10C -Name $dword01 -Value $value01 -PropertyType DWORD -Force
   New-ItemProperty -Path $ProtocolDirT10C -Name $dword02 -Value $value02 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

IF((Test-Path $ProtocolDirT10S) -eq $true)

   { 

   New-ItemProperty -Path $ProtocolDirT10S -Name $dword01 -Value $value01 -PropertyType DWORD -Force
   New-ItemProperty -Path $ProtocolDirT10S -Name $dword02 -Value $value02 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

IF((Test-Path $ProtocolDirT11C) -eq $true)

   { 

   New-ItemProperty -Path $ProtocolDirT11C -Name $dword01 -Value $value01 -PropertyType DWORD -Force
   New-ItemProperty -Path $ProtocolDirT11C -Name $dword02 -Value $value02 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

IF((Test-Path $ProtocolDirT11S) -eq $true)

   { 

   New-ItemProperty -Path $ProtocolDirT11S -Name $dword01 -Value $value01 -PropertyType DWORD -Force
   New-ItemProperty -Path $ProtocolDirT11S -Name $dword02 -Value $value02 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

IF((Test-Path $ProtocolDirT12C) -eq $true)

   { 

   New-ItemProperty -Path $ProtocolDirT12C -Name $dword01 -Value $value01 -PropertyType DWORD -Force
   New-ItemProperty -Path $ProtocolDirT12C -Name $dword02 -Value $value02 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02

IF((Test-Path $ProtocolDirT12S) -eq $true)

   { 

   New-ItemProperty -Path $ProtocolDirT12S -Name $dword01 -Value $value01 -PropertyType DWORD -Force
   New-ItemProperty -Path $ProtocolDirT12S -Name $dword02 -Value $value02 -PropertyType DWORD -Force
   Write-Output "The DWORD Created Successfully and Enabled"

   } Else{Write-Output "The Directory does not exist"}

Start-Sleep 02