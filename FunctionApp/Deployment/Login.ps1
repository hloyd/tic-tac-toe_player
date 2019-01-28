$username = "deployUser"
$password = ConvertTo-SecureString -String "rfid123!" -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $password
$subscription = "0bb50060-a34f-4f2c-a36f-21836bf6d0e5"
$tenant = "629fea65-2751-4995-acb4-850c6670f000"


Connect-AzureRmAccount -credential $Credential -subscription $subscription -Force


$Credential = Get-Credential

Connect-AzureRmAccount -Credential $Credential -Tenant "xxxx-xxxx-xxxx-xxxx" -ServicePrincipal