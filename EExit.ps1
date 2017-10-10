#This process is to fully lockout a user from their CUI acounts as well as create a record
param([string]$Username = "-")
#Sets parameters to be used throughout script. If a parameter is not correctly specified it will simple cause an error becasue
#the default value, unless otherwise specified is a -
echo "  "
echo "  "
Start-Transcript -Path "C:\Exit_Notice_Log_Files\log$Username.txt"
#Starts creating a full record of the session at C:\Exit_Notice_Log_Files in a new text file with the  
#users E#
echo "  "
echo "  "
get-ADUser $Username -properties Enabled | select sAMAccountName,name,enabled
#Gets the users ADAccount information
echo "  "
echo "  "
Get-ADPrincipalGroupMembership $Username | select -Expand name 
#Gets the users current group membership by the name only. -Expand causes it to be seperate from
#the above command otherwise the groups appear as "grp_name_Gro..." and don't continue
echo "  "
echo "  "
#disable-adaccount $Username
#Disables the Users AD Account
echo "  "
echo "  "
Stop-Transcript
#Stops the Transcript