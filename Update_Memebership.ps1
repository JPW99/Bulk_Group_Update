<#

Add users to specific groups via PowerShell

Written by : Joshua Wallace

#>

#Create log file
$Logfile = "Enter When Ready to use \Add_Users_To_Groups_$(Get-Date -Format yyyy-MM-DD-HHmm).txt"

Start-Transcript -Path $Logfile -Force -Confirm:$false



#Import CSV
$CSV_Path = "Enter When Ready to Use"
Import-Csv -Path $CSV_Path | foreach {

    $User = $_.UPN.trim()
    $GroupName = $_.Group.trim()
    $Server = "Enter When Ready to Use"

    Add-ADGroupMember -Identity $GroupName -Members $User -Server $Server

        #write-host for testing only
            Write-Host "$User has been added to $GroupName."
}