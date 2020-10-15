$domain = "pgs.local"
$user = "Administrator"
$password = Read-Host -Prompt "password type for $user" -AsSecureString
$username = "$domain\$user"
$credential = New-Object System.Management.Automation.PSCredential($username,$password)

Add-Computer -DomainName $domain -Credential $credential

Restart-Computer

# other way

Add-Computer -DomainName pgs.local -Credential AD\adminuser
