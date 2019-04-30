<#
.Synopsis
   Script to check and disable Ciphers

.DESCRIPTION
   Disabling below Cipher Suite
    "TLS_RSA_WITH_RC4_128_SHA"
    "TLS_RSA_WITH_RC4_128_MD5"
    "TLS_RSA_WITH_3DES_EDE_CBC_SHA"
    "TLS_DHE_RSA_WITH_AES_128_GCM_SHA256"
    "TLS_DHE_RSA_WITH_AES_256_GCM_SHA384"

.EXAMPLE
   
   DisableCipher -Cipher "TLS_RSA_WITH_RC4_128_SHA"

.NOTES
 Name : Disable-WeakCiphers.ps1
 Author : Vijay Borkar
 Version : 0.1
#>



function DisableWeak-Cipher($Cipher)
{
if(Get-TlsCipherSuite -Name $Cipher)
{
    Disable-TlsCipherSuite -Name $Cipher
    Write-Host "$Cipher - Disabled" -f Green
}
else
{
    Write-Host "$cipher was already in disabled state" -f Cyan
}
}

DisableWeak-Cipher "TLS_RSA_WITH_RC4_128_SHA"
DisableWeak-Cipher "TLS_RSA_WITH_RC4_128_MD5"
DisableWeak-Cipher "TLS_RSA_WITH_3DES_EDE_CBC_SHA"
DisableWeak-Cipher "TLS_DHE_RSA_WITH_AES_128_GCM_SHA256"
DisableWeak-Cipher "TLS_DHE_RSA_WITH_AES_256_GCM_SHA384"

