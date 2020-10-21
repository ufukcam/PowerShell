# Adds ufuk user to product group

Add-ADGroupMember product -Members ufuk

# Removing an object from a group 

Remove-ADGroupMember -Identity product -Members ufuk

# Unlock Account

Unlock-ADAccount -Identity ufuk ;

# List of expire accounts

Search-ADAccount –AccountExpired 

# List of expire passwords accounts

Search-ADAccount –PasswordExpired 

# Disable Account 

Disable-ADAccount -Identity ufuk ; 

#Enable Account

Enable-ADAccount -Identity ufuk;

# List of password never expires list

Search-ADAccount –PasswordNeverExpires | ft name  

# Add AD User to "Accounting" OU

New-ADUser -Name "Ufuk Cam" -GivenName "Ufuk" -Surname "Cam" -SamAccountName "ufuk.cam" -UserPrincipalName "ufuk.cam@mail.com" -Path "OU=Accounting,DC=enterprise,DC=com" -AccountPassword(Read-Host -AsSecureString "Input PW") -Enabled $true

# Let's list the details of this user

Get-ADUser ufuk.cam -Properties CanonicalName, Enabled, GivenName, Surname, Name, UserPrincipalName, samAccountName, whenCreated, PasswordLastSet  | Select CanonicalName, Enabled, GivenName, Surname, Name, UserPrincipalName, samAccountName, whenCreated, PasswordLastSet

# Create New Global Group

New-ADGroup -name "product" -groupscope Global

 # New OU 

 New-ADOrganizationalUnit -Name "Name" -Path "DC=Domain,DC=com"

 # Reset password 

 Set-ADAccountPassword ufuk -Reset -NewPassword (ConvertTo-SecureString -AsPlainText "newpasswordishere" -Force -Verbose) –PassThru

 