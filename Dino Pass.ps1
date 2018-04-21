#Config
$dPassUrl = "http://www.dinopass.com/password/simple" #Change this to http://www.dinopass.com/password/strong for strong passwords
$start_time = Get-Date
$debug = 0
$rateLimiter = 0 #Rate limiter in seconds before we go grab another password
$generate1Password = 0 #Generates 1 Password only when run

function passwordGenerator{
        $webRequestStrong = Invoke-WebRequest -Uri $dPassUrl -Headers @{"Cache-Control"="no-cache"}
        $webRequestStrong.content
        if ($debug)
        {
            debug
        }
            else
        {
            Start-Sleep -Seconds $rateLimiter
        }
}
function debug{    
    Write-Output "API Responce Time: $((Get-Date).Subtract($start_time).Milliseconds)Ms"
    $webRequest.RawContent
}   
if ($generate1Password){
    passwordGenerator
    pause
}
else
{
while($true){
    passwordGenerator
}
}