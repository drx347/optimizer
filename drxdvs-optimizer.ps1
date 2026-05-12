Clear-Host
$host.UI.RawUI.WindowTitle = "EXOTICKIC ROOT ACCESS"
$global:color = "Green"

function Type-Text($text, $delay = 15) {
    foreach ($char in $text.ToCharArray()) {
        Write-Host -NoNewline $char -ForegroundColor $global:color
        Start-Sleep -Milliseconds $delay
    }
    Write-Host ""
}

function Pause-Internal {
    Write-Host ""
    Read-Host "Press Enter to continue..."
}

function Draw-Line {
    Write-Host "====================================================================" -ForegroundColor DarkGreen
}

function Write-PanelLine($text = "", $color = "Green") {
    $innerWidth = 68
    if ($text.Length -gt $innerWidth) {
        $text = $text.Substring(0, $innerWidth)
    }

    $padding = " " * ($innerWidth - $text.Length)
    Write-Host "$text$padding" -ForegroundColor $color
}

function Matrix-Rain {
    for ($i = 0; $i -lt 12; $i++) {
        $line = -join ((48..57 + 65..90) | Get-Random -Count 60 | ForEach-Object { [char]$_ })
        Write-Host $line -ForegroundColor DarkGreen
        Start-Sleep -Milliseconds 25
    }
}

function Loading-Bar {
    Write-Host ""
    $bar = "############################"
    for ($i = 0; $i -le $bar.Length; $i++) {
        Write-Host -NoNewline "`r["
        Write-Host -NoNewline ($bar.Substring(0, $i)) -ForegroundColor Green
        Write-Host -NoNewline (" " * ($bar.Length - $i))
        Write-Host -NoNewline "]"
        Start-Sleep -Milliseconds 20
    }
    Write-Host ""
}

function Banner {
    Draw-Line
    Write-PanelLine "== ROOT SHELL == SECURE SESSION == EXOTICKIC NODE ONLINE =="
    Draw-Line
    Write-PanelLine ""
    Write-PanelLine "                         EXOTICKIC"
    Write-PanelLine "                  System Optimizer Console"
    Write-PanelLine ""
    Draw-Line
    Write-PanelLine "== STATUS : SYSTEM OPTIMIZER READY"
    Write-PanelLine "== ACCESS : root@exotickic"
    Write-PanelLine "== AUTHOR : GITHUB:@drx347"
    Write-PanelLine "== SIGNAL : =========> STABLE LINK"
    Draw-Line
    Write-Host ""
}

function Fake-Scan {
    $tasks = @(
        "Bypassing system security...",
        "Injecting kernel modules...",
        "Scanning memory sectors...",
        "Optimizing CPU threads...",
        "Cleaning junk cache...",
        "Stabilizing network..."
    )

    foreach ($task in $tasks) {
        Type-Text "[EXOTICKIC] $task"
        Start-Sleep -Milliseconds (Get-Random -Minimum 200 -Maximum 500)
    }
}

function Done-Effect {
    Write-Host ""
    Banner
    Type-Text "[EXOTICKIC] [DONE] SYSTEM FULLY OPTIMIZED"
}

function Show-Menu {
    Clear-Host
    Banner
    Write-Host "[1] Safe Optimize" -ForegroundColor Green
    Write-Host "[2] Super Optimize" -ForegroundColor Green
    Write-Host "[3] Exit" -ForegroundColor Green
    Write-Host ""
}

function Optimize {
    Type-Text "[EXOTICKIC] Accessing system core..."
    Matrix-Rain
    Fake-Scan

    Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue
    Remove-Item "C:\Windows\Temp\*" -Recurse -Force -ErrorAction SilentlyContinue
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    ipconfig /flushdns | Out-Null

    Loading-Bar
    Done-Effect
}

function SuperOptimize {
    Type-Text "[EXOTICKIC] ROOT ACCESS GRANTED"
    Matrix-Rain
    Fake-Scan

    Optimize

    $services = @("DiagTrack", "SysMain", "WSearch")
    foreach ($service in $services) {
        Stop-Service $service -Force -ErrorAction SilentlyContinue
        Set-Service $service -StartupType Disabled -ErrorAction SilentlyContinue
    }

    Remove-Item "C:\Windows\Prefetch\*" -Force -ErrorAction SilentlyContinue
    netsh int ip reset | Out-Null
    netsh winsock reset | Out-Null

    Loading-Bar
    Done-Effect
}

do {
    Show-Menu
    $choice = Read-Host "root@exotickic:~#"

    switch ($choice) {
        "1" { Optimize; Pause-Internal }
        "2" { SuperOptimize; Pause-Internal }
        "3" { break }
        default {
            Write-Host "Invalid command!" -ForegroundColor Green
            Start-Sleep -Seconds 1
        }
    }
} while ($true)
