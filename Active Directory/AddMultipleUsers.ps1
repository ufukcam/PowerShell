#  Multi Users
#  Enter a path to your import CSV file
#  Example CSV File https://antickle.sirv.com/exampleCSV.jpg
$ADUsers = Import-csv C:\userlist.csv

foreach ($User in $ADUsers)
{

       $Username    = $User.username
       $Password    = $User.password
       $Firstname   = $User.firstname
       $Lastname    = $User.lastname
    $Department = $User.department
       $OU           = $User.ou
              
       if (Get-ADUser -F {SamAccountName -eq $Username}) # #Check if the user account already exists in AD
       {
              
               Write-Warning "A user account $Username has already exist"
       }
       else
       {
              #If a user does not exist 
          
             New-ADUser `
            -SamAccountName $Username `
            -UserPrincipalName "$Username@yourdomain.com" `
            -Name "$Firstname $Lastname" `
            -GivenName $Firstname `
            -Surname $Lastname `
            -Enabled $True `
            -ChangePasswordAtLogon $True `
            -DisplayName "$Lastname, $Firstname" `
            -Department $Department `
            -Path $OU `
            -AccountPassword (convertto-securestring $Password -AsPlainText -Force)

       }
}
