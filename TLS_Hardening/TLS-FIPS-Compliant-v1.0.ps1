<#
.Synopsis
   PS-Script to perform the TLS-FIPS compliance 

.DESCRIPTION
   The following script check the compliance with the security standards like "TLS and FIPS". 


.NOTES
 Name : TLS-FIPS-Compliant.ps1
 Author : Vijay Borkar
 Version : 1.0
#>



$List = Import-Csv D:\Day2DayActivity\RDP_Hardening\Server-List.csv
$ServerList = ($List).name


foreach ($server in $ServerList){
    If(!(Test-Connection -ComputerName $server -Count 1 -Quiet)) {
			Write-host "$sever is offline. Please Turn ON the Instance" -ForegroundColor Red
			}
             else {
                    $password = ConvertTo-SecureString "Welcome!1234" -AsPlainText -Force
                    $username = "MyUsername"
                    $credential = New-object System.Management.Automation.PSCredential ($username,$password)
                    Enter-PSSession -ComputerName $server -Credential $credential

                        #Enable Remote Desktop Connections
                        $RDP = Get-WmiObject -Class Win32_TerminalServiceSetting -ComputerName $server -Namespace root\CIMV2\TerminalServices -Filter "TerminalName='RDP-tcp'"
                        $Result = $RDP.SetAllowTSConnections(1)
                            if ($Result.ReturnValue -eq 1){
                                    Write-Host "Remote Connection settings changed sucessfully"
                                        } else {
                                                Write-Host ("Failed to change Remote Connections setting(s), return code "+$Result.ReturnValue) -ForegroundColor Red
                                                exit
                                                    }


                         # NLA (Network Level Authentication)
                         $NLA = Get-WmiObject -Class Win32_TSGeneralSetting -ComputerName $server -Namespace root\CIMV2\TerminalServices -Filter "TerminalName='RDP-tcp'"
                         $NLA.SetUserAuthenticationRequired(1) | Out-Null
                            if ($NLA.UserAuthenticationRequired -eq 1){
                                    Write-Host "NLA setting changed sucessfully"
                                        } else {
                                                Write-Host "Failed to change NLA setting" -ForegroundColor Red
                                                exit
                                                    }
                 }


}