#Config
$dPassUrl = "http://www.dinopass.com/password/simple" 
$txtfile = "$PSScriptRoot\pass.txt"
$start_time = Get-Date
$displayResponceTime = 0 #Indicates if we show the API Responce time
$rateLimiter = 0 #Rate limiter in seconds before we go grab another password
$generate1Password = 1 #Generates 1 Password only when run

function passwordGenerator 
{
    Invoke-WebRequest -Uri $dPassUrl -OutFile $txtfile
        if ($displayResponceTime)
        {
            Write-Output "API Responce Time: $((Get-Date).Subtract($start_time).Milliseconds)Ms"
        }
    get-Content $txtfile
    Start-Sleep -Seconds $rateLimiter
}
function cleanUp
{
Remove-Item $txtfile 
}



if ($generate1Password)
{
passwordGenerator
cleanUp
}
else
{
While($true){
passwordGenerator
cleanUp
}
}