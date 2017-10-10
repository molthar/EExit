#This process is to fully lockout a user from their CUI acounts as well as create a record
param([string]$Username = "-")
#Sets parameters to be used throughout script. If a parameter is not correctly specified it will simple cause an error becasue the default value
#unless otherwise specified is a -
echo "  "
echo "  "
Start-Transcript -Path "C:\Exit_Notice_Log_Files\log$Username.txt"
#Starts creating a full record of the session at C:\Exit_Notice_Log_Files in a new text file with the  
#users E#
echo "  "
echo "  "
get-aduser $Username -properties Enabled | select sAMAccountName,Enabled,name
#Gets the users ADAccount information
echo "  "
echo "  "
Get-ADPrincipalGroupMembership $Username | select name
#Gets the users current group membership and 
echo "  "
echo "  "
#disable-adaccount $Username
#Disables the Users AD Account
echo "  "
echo "  "
Stop-Transcript
#Stops the Transcript
