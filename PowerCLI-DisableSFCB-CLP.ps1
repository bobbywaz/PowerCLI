#PowerCLI script to disable SFCB and SLP on all hosts on vCenter for randsomware/malware, encryption scripts.


# Prompt user to enter password
$vcsapassword = Read-Host 'What is your password?' -AsSecureString
# Connect to the server
connect-viserver -server "EXO-AST-VCSA-01.ex.local" -user "administrator@ex.local" -password $vcsapassword
# Turn off SFCB
Get-VMHost | Get-VMHostService | Where {$_.Key –eq "sfcbd-watchdog"} | Stop-VMHostService -Confirm:$false
# Turn off SLP
Get-VMHost | Get-VMHostService | Where {$_.Key –eq "slpd"} | Stop-VMHostService -Confirm:$false
# Disable SFCB
Get-VMHost | Get-VMHostService | Where {$_.Key –eq "sfcbd-watchdog"} | Set-VMHostService -Policy Off -Confirm:$false
# Disable SLP
Get-VMHost | Get-VMHostService | Where {$_.Key –eq "slpd"} | Set-VMHostService -Policy Off -Confirm:$false
