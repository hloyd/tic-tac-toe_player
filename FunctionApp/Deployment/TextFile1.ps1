
$siteName = 'FunctionApp-test-hl'
$ResourceGroupName = 'function-app-test'
$PublishingProfile = [xml](Get-AzureRmWebAppPublishingProfile -ResourceGroupName $ResourceGroupName -Name $siteName)

$Username = (Select-Xml -Xml $PublishingProfile -XPath "//publishData/publishProfile[contains(@profileName,'Web Deploy')]/@userName").Node.Value
$Password = (Select-Xml -Xml $PublishingProfile -XPath "//publishData/publishProfile[contains(@profileName,'Web Deploy')]/@userPWD").Node.Value

$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $Username,$Password)))

$apiUrl = "https://$siteName.scm.azurewebsites.net/api/zipdeploy";

Invoke-RestMethod -Uri $apiUrl -InFile 'D:\site.zip' -Headers @{Authorization=("Basic {0}" -f $base64AuthInfo)} -Method Post -ContentType "multipart/form-date";