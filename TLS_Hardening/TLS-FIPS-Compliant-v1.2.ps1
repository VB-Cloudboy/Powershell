<#
.Synopsis
   PS-Script to perform the TLS-FIPS compliance 

.DESCRIPTION
   The following script check the compliance with the security standards like "TLS and FIPS". 


.NOTES
 Name : TLS-FIPS-Compliant.ps1
 Author : Vijay Borkar
 Version : 1.2
#>




#Function Test-openport



$Port = "5985"
foreach ($server in $ServerList){

    try{
        $tcp = New-Object System.Net.Sockets.TcpClient
        $tcp.connect($server, $Port)
        Write-Host "Successfully connected to $server on Port: $Port" -ForegroundColor Green
        $tcp.close()
        Enter-PSSession -ComputerName $server -Credential $Credentials

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

    Catch{
             Write-Host "Could not connect to $server on Port: $Port" -ForegroundColor Red
            }



    }

    








