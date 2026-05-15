Clear-Host
$host.UI.RawUI.WindowTitle = "EXOTICKIC ROOT ACCESS"
$global:color = "Green"
$global:accent = "DarkGreen"
$global:optimizeErrors = 0

function Type-Text($text, $delay = 15) {
    foreach ($char in $text.ToCharArray()) {
        Write-Host -NoNewline $char -ForegroundColor $global:color
        Start-Sleep -Milliseconds $delay
    }
    Write-Host ""
}

function Pause-Internal {
    Write-Host ""
    Read-Host "Press Enter to return to terminal..."
}

function Draw-Line {
    Write-Host "+------------------------------------------------------------------+" -ForegroundColor $global:accent
}

function Write-PanelLine($text = "", $color = "Green") {
    $innerWidth = 66
    if ($text.Length -gt $innerWidth) {
        $text = $text.Substring(0, $innerWidth)
    }

    $padding = " " * ($innerWidth - $text.Length)
    Write-Host -NoNewline "|" -ForegroundColor $global:accent
    Write-Host -NoNewline "$text$padding" -ForegroundColor $color
    Write-Host "|" -ForegroundColor $global:accent
}

function Matrix-Rain {
    $chars = "01ABCDEFGHIJKLMNOPQRSTUVWXYZ$#@%&"
    for ($i = 0; $i -lt 28; $i++) {
        $line = -join (1..66 | ForEach-Object { $chars[(Get-Random -Minimum 0 -Maximum $chars.Length)] })
        Write-Host " $line" -ForegroundColor DarkGreen
        Start-Sleep -Milliseconds 35
    }
}

function Glitch-Text($text, $repeat = 3) {
    $noise = @("#", "%", "&", "0", "1", "/", "\", "|", ":", ";", "X")
    for ($i = 0; $i -lt $repeat; $i++) {
        $garble = -join (1..($text.Length) | ForEach-Object { $noise | Get-Random })
        Write-Host "`r$garble" -NoNewline -ForegroundColor DarkGreen
        Start-Sleep -Milliseconds 45
    }
    Write-Host "`r$text" -ForegroundColor Green
}

function Loading-Bar($label = "EXECUTING PAYLOAD", $delay = 55) {
    Write-Host ""
    $bar = "##################################################"
    for ($i = 0; $i -le $bar.Length; $i++) {
        $percent = [math]::Floor(($i / $bar.Length) * 100)
        Write-Host -NoNewline "`r["
        Write-Host -NoNewline ($bar.Substring(0, $i)) -ForegroundColor Green
        Write-Host -NoNewline (" " * ($bar.Length - $i))
        Write-Host -NoNewline "] "
        Write-Host -NoNewline ("{0,3}%" -f $percent) -ForegroundColor Green
        Write-Host -NoNewline " :: $label"
        Start-Sleep -Milliseconds $delay
    }
    Write-Host ""
}

function Write-Trace($status, $message, $color = "Green") {
    $stamp = Get-Date -Format "HH:mm:ss"
    Write-Host -NoNewline "[$stamp] " -ForegroundColor DarkGray
    Write-Host -NoNewline "[$status] " -ForegroundColor $color
    Type-Text $message 4
}

function Invoke-HackStep($status, $message, $minDelay = 420, $maxDelay = 900) {
    Write-Trace $status $message
    Start-Sleep -Milliseconds (Get-Random -Minimum $minDelay -Maximum $maxDelay)
}

function Invoke-ProcessStages($profile, $rounds = 3) {
    $stages = @(
        "handshake established",
        "payload channel opened",
        "memory lane indexed",
        "operation queue locked",
        "execution mask verified",
        "final sync completed"
    )

    Write-Host ""
    for ($round = 1; $round -le $rounds; $round++) {
        foreach ($stage in $stages) {
            $percent = [math]::Min(99, [math]::Floor((($round - 1) * $stages.Count + [array]::IndexOf($stages, $stage) + 1) / ($rounds * $stages.Count) * 100))
            Write-Trace "STAGE" "$profile :: $stage :: $percent%"
            Start-Sleep -Milliseconds (Get-Random -Minimum 240 -Maximum 520)
        }
    }
}

function Invoke-SafeAction($message, [scriptblock]$action) {
    Invoke-HackStep "EXEC" $message
    try {
        $previousErrorAction = $ErrorActionPreference
        $ErrorActionPreference = "Stop"
        & $action 2>$null | Out-Null
    }
    catch {
        $global:optimizeErrors++
        Write-Trace "SKIP" "$message :: permission locked or unavailable" "DarkGreen"
    }
    finally {
        $ErrorActionPreference = $previousErrorAction
    }
}

function Banner {
    Draw-Line
    Write-PanelLine " EXOTICKIC ROOT SHELL // SECURE SESSION // NODE ONLINE"
    Draw-Line
    Write-PanelLine " TARGET : EXOTICKIC SYSTEM OPTIMIZER"
    Write-PanelLine " MODE   : PERFORMANCE TERMINAL"
    Write-PanelLine " SHELL  : encrypted local session"
    Write-PanelLine " CORE   : cleanup / cache / dns / network / security / license"
    Draw-Line
    Write-PanelLine " STATUS : SYSTEM OPTIMIZER READY"
    Write-PanelLine " ACCESS : root@exotickic"
    Write-PanelLine " AUTHOR : GITHUB:@drx347"
    Write-PanelLine " SIGNAL : =========> STABLE LINK"
    Draw-Line
    Write-Host ""
}

function Fake-Scan($profile = "Safe") {
    if ($profile -eq "Super") {
        $tasks = @(
            "elevating optimizer profile",
            "locking telemetry service map",
            "probing prefetch cache layer",
            "queuing tcp/ip stack rebuild",
            "queuing winsock catalog reset",
            "binding aggressive cleanup payload",
            "super profile armed"
        )
    }
    elseif ($profile -eq "Cache") {
        $tasks = @(
            "indexing temporary cache nodes",
            "marking browser residue signatures",
            "checking recycle container state",
            "preparing cache sweep payload",
            "cache cleaner armed"
        )
    }
    elseif ($profile -eq "Network") {
        $tasks = @(
            "probing dns resolver cache",
            "checking tcp/ip route table",
            "validating winsock catalog",
            "queuing network refresh payload",
            "network profile armed"
        )
    }
    elseif ($profile -eq "Services") {
        $tasks = @(
            "mapping background services",
            "checking startup profile",
            "tagging heavy telemetry modules",
            "preparing service tune payload",
            "service profile armed"
        )
    }
    elseif ($profile -eq "Scan") {
        $tasks = @(
            "reading operating system profile",
            "sampling processor identity",
            "checking memory channel",
            "checking disk channel",
            "system scan payload armed"
        )
    }
    elseif ($profile -eq "Virus") {
        $tasks = @(
            "checking defender module",
            "loading malware signature channel",
            "mapping critical system paths",
            "arming quick threat scan",
            "security scan payload armed"
        )
    }
    elseif ($profile -eq "License") {
        $tasks = @(
            "checking Windows license channel",
            "reading activation service state",
            "validating official key workflow",
            "preparing Microsoft settings bridge",
            "license helper payload armed"
        )
    }
    else {
        $tasks = @(
            "mounting local temp sectors",
            "mapping cache fragments",
            "fingerprinting junk signatures",
            "dns resolver buffer purge queued",
            "recycle container marked",
            "safe cleanup payload compiled"
        )
    }

    foreach ($task in $tasks) {
        Invoke-HackStep "TRACE" "EXOTICKIC::$task"
    }
}

function System-Grid($profile = "Safe") {
    if ($profile -eq "Super") {
        $rows = @(
            "CPU       [##########] aggressive profile",
            "MEMORY    [#########-] deep scan ready",
            "CACHE     [########--] temp + prefetch target",
            "DNS       [#########-] resolver reset queued",
            "NETWORK   [########--] tcp/ip + winsock queued",
            "SERVICES  [########--] telemetry/search target"
        )
    }
    elseif ($profile -eq "Cache") {
        $rows = @(
            "CPU       [#####-----] light sweep",
            "MEMORY    [######----] cache map",
            "CACHE     [##########] primary target",
            "DNS       [----------] untouched",
            "NETWORK   [----------] untouched",
            "SERVICES  [----------] untouched"
        )
    }
    elseif ($profile -eq "Network") {
        $rows = @(
            "CPU       [####------] light touch",
            "MEMORY    [####------] light touch",
            "CACHE     [##--------] untouched",
            "DNS       [##########] flush target",
            "NETWORK   [##########] stack refresh",
            "SERVICES  [----------] untouched"
        )
    }
    elseif ($profile -eq "Services") {
        $rows = @(
            "CPU       [######----] background tune",
            "MEMORY    [######----] startup relief",
            "CACHE     [----------] untouched",
            "DNS       [----------] untouched",
            "NETWORK   [----------] untouched",
            "SERVICES  [##########] primary target"
        )
    }
    elseif ($profile -eq "Scan") {
        $rows = @(
            "CPU       [########--] reading info",
            "MEMORY    [########--] reading info",
            "CACHE     [####------] no changes",
            "DNS       [####------] no changes",
            "NETWORK   [####------] no changes",
            "SERVICES  [####------] no changes"
        )
    }
    elseif ($profile -eq "Virus") {
        $rows = @(
            "DEFENDER  [##########] module target",
            "SIGNATURE [########--] status check",
            "MEMORY    [#########-] threat scan",
            "STARTUP   [########--] quick scan",
            "SYSTEM    [########--] protected paths",
            "NETWORK   [###-------] untouched"
        )
    }
    elseif ($profile -eq "License") {
        $rows = @(
            "WINDOWS   [##########] license target",
            "KEY       [########--] official key only",
            "STATUS    [########--] activation check",
            "SETTINGS  [#########-] activation bridge",
            "NETWORK   [######----] online activation",
            "SYSTEM    [----------] no bypass"
        )
    }
    else {
        $rows = @(
            "CPU       [######----] light touch",
            "MEMORY    [######----] quick scan",
            "CACHE     [########--] temp target",
            "DNS       [#######---] flush queued",
            "NETWORK   [####------] untouched",
            "SERVICES  [----------] untouched"
        )
    }

    foreach ($row in $rows) {
        Write-Host "   > $row" -ForegroundColor Green
        Start-Sleep -Milliseconds 90
    }
}

function Done-Effect($profile = "SYSTEM") {
    Write-Host ""
    Banner
    Glitch-Text "[EXOTICKIC] [DONE] $profile PROFILE APPLIED" 5
    Write-Host ""
    Write-Host "   SESSION CLOSED :: PERFORMANCE PROFILE APPLIED" -ForegroundColor DarkGreen
    if ($global:optimizeErrors -gt 0) {
        Write-Host "   NOTE :: $global:optimizeErrors locked task(s) skipped without terminal errors" -ForegroundColor DarkGreen
    }
}

function Invoke-SafeOptimizeActions($prefix = "") {
    $labelPrefix = $prefix.Trim()
    if ($labelPrefix.Length -gt 0) {
        $labelPrefix = "$labelPrefix "
    }

    Invoke-SafeAction "$($labelPrefix)purging user temp directory" {
        Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction Stop
    }
    Invoke-SafeAction "$($labelPrefix)purging windows temp directory" {
        Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction Stop
    }
    Invoke-SafeAction "$($labelPrefix)emptying recycle bin" {
        Clear-RecycleBin -Force -ErrorAction Stop
    }
    Invoke-SafeAction "$($labelPrefix)flushing dns resolver cache" {
        ipconfig /flushdns
    }
}

function Show-MainMenu {
    Clear-Host
    Banner
    Write-Host " root@exotickic:~$ select module" -ForegroundColor DarkGreen
    Write-Host ""
    Write-Host "   [1] Optimizer Profiles" -ForegroundColor Green
    Write-Host "   [2] Quick System Scan" -ForegroundColor Green
    Write-Host "   [3] Virus Scan" -ForegroundColor Green
    Write-Host "   [4] Microsoft Activation Helper" -ForegroundColor Green
    Write-Host "   [5] Exit" -ForegroundColor Green
    Write-Host ""
}

function Show-OptimizeMenu {
    Clear-Host
    Banner
    Write-Host " optimize@exotickic:~$ choose execution profile" -ForegroundColor DarkGreen
    Write-Host ""
    Write-Host "   [1] Safe Optimize     :: cache, temp, recycle, dns" -ForegroundColor Green
    Write-Host "   [2] Super Optimize    :: safe profile + service/network reset" -ForegroundColor Green
    Write-Host "   [3] Cache Sweep       :: temp, windows temp, recycle only" -ForegroundColor Green
    Write-Host "   [4] Network Boost     :: dns, tcp/ip, winsock refresh" -ForegroundColor Green
    Write-Host "   [5] Service Tune      :: tune selected background services" -ForegroundColor Green
    Write-Host "   [6] System Scan       :: view system profile, no changes" -ForegroundColor Green
    Write-Host "   [7] Virus Scan        :: Windows Defender quick threat scan" -ForegroundColor Green
    Write-Host "   [8] Activation Helper :: official Microsoft activation tools" -ForegroundColor Green
    Write-Host "   [9] Back" -ForegroundColor Green
    Write-Host ""
}

function Show-ActivationMenu {
    Clear-Host
    Banner
    Write-Host " license@exotickic:~$ official Microsoft activation helper" -ForegroundColor DarkGreen
    Write-Host ""
    Write-Host "   [1] Check Windows Activation Status" -ForegroundColor Green
    Write-Host "   [2] Open Windows Activation Settings" -ForegroundColor Green
    Write-Host "   [3] Activate With Official Product Key" -ForegroundColor Green
    Write-Host "   [4] Back" -ForegroundColor Green
    Write-Host ""
}

function Optimize([switch]$Embedded) {
    $global:optimizeErrors = 0
    if (-not $Embedded) {
        Clear-Host
        Banner
        Glitch-Text "[EXOTICKIC] SAFE CLEANUP SEQUENCE" 4
        System-Grid "Safe"
        Fake-Scan "Safe"
        Invoke-ProcessStages "SAFE CLEANUP" 2
    }

    Invoke-SafeOptimizeActions

    if (-not $Embedded) {
        Loading-Bar "SAFE CLEANUP" 60
        Done-Effect "SAFE"
    }
}

function CacheSweep {
    $global:optimizeErrors = 0
    Clear-Host
    Banner
    Glitch-Text "[EXOTICKIC] CACHE SWEEP SEQUENCE" 4
    System-Grid "Cache"
    Fake-Scan "Cache"
    Invoke-ProcessStages "CACHE SWEEP" 2

    Invoke-SafeAction "cache layer :: purging user temp directory" {
        Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction Stop
    }
    Invoke-SafeAction "cache layer :: purging windows temp directory" {
        Remove-Item -Path "C:\Windows\Temp\*" -Recurse -Force -ErrorAction Stop
    }
    Invoke-SafeAction "cache layer :: emptying recycle bin" {
        Clear-RecycleBin -Force -ErrorAction Stop
    }

    Loading-Bar "CACHE SWEEP" 60
    Done-Effect "CACHE"
}

function NetworkBoost {
    $global:optimizeErrors = 0
    Clear-Host
    Banner
    Glitch-Text "[EXOTICKIC] NETWORK BOOST SEQUENCE" 4
    Matrix-Rain
    System-Grid "Network"
    Fake-Scan "Network"
    Invoke-ProcessStages "NETWORK BOOST" 3

    Invoke-SafeAction "network layer :: flushing dns resolver cache" {
        ipconfig /flushdns
    }
    Invoke-SafeAction "network layer :: resetting tcp/ip stack" {
        netsh int ip reset
    }
    Invoke-SafeAction "network layer :: resetting winsock catalog" {
        netsh winsock reset
    }

    Loading-Bar "NETWORK BOOST" 70
    Done-Effect "NETWORK"
}

function ServiceTune {
    $global:optimizeErrors = 0
    Clear-Host
    Banner
    Glitch-Text "[EXOTICKIC] SERVICE TUNE SEQUENCE" 5
    System-Grid "Services"
    Fake-Scan "Services"
    Invoke-ProcessStages "SERVICE TUNE" 3

    $services = @("DiagTrack", "SysMain", "WSearch")
    foreach ($service in $services) {
        Invoke-SafeAction "service layer :: disabling service profile :: $service" {
            Stop-Service $service -Force -ErrorAction Stop -WarningAction SilentlyContinue
            Set-Service $service -StartupType Disabled -ErrorAction Stop -WarningAction SilentlyContinue
        }
    }

    Loading-Bar "SERVICE TUNE" 70
    Done-Effect "SERVICES"
}

function SystemScan {
    $global:optimizeErrors = 0
    Clear-Host
    Banner
    Glitch-Text "[EXOTICKIC] SYSTEM SCAN SEQUENCE" 4
    System-Grid "Scan"
    Fake-Scan "Scan"
    Invoke-ProcessStages "SYSTEM SCAN" 2

    try {
        $os = Get-CimInstance Win32_OperatingSystem -ErrorAction Stop
        $cpu = Get-CimInstance Win32_Processor -ErrorAction Stop | Select-Object -First 1
        $disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'" -ErrorAction Stop
        $freeGb = [math]::Round($disk.FreeSpace / 1GB, 2)
        $totalGb = [math]::Round($disk.Size / 1GB, 2)
        $memoryGb = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2)

        Write-Host ""
        Write-Trace "INFO" "OS       :: $($os.Caption)"
        Write-Trace "INFO" "CPU      :: $($cpu.Name)"
        Write-Trace "INFO" "MEMORY   :: $memoryGb GB"
        Write-Trace "INFO" "DISK C   :: $freeGb GB free / $totalGb GB total"
        Write-Trace "INFO" "BOOT     :: $($os.LastBootUpTime)"
    }
    catch {
        $global:optimizeErrors++
        Write-Trace "SKIP" "system profile unavailable" "DarkGreen"
    }

    Loading-Bar "SYSTEM SCAN" 55
    Done-Effect "SCAN"
}

function VirusScan {
    $global:optimizeErrors = 0
    Clear-Host
    Banner
    Glitch-Text "[EXOTICKIC] VIRUS SCANNING SEQUENCE" 6
    Matrix-Rain
    System-Grid "Virus"
    Fake-Scan "Virus"
    Invoke-ProcessStages "VIRUS SCAN" 4

    Invoke-SafeAction "security layer :: checking defender status" {
        Get-MpComputerStatus
    }
    Invoke-SafeAction "security layer :: starting Windows Defender quick scan" {
        Start-MpScan -ScanType QuickScan
    }

    Loading-Bar "VIRUS SCANNING" 85
    Done-Effect "VIRUS SCAN"
}

function Get-LicenseStatusName($status) {
    switch ($status) {
        0 { "Unlicensed" }
        1 { "Licensed" }
        2 { "Out-of-box grace" }
        3 { "Out-of-tolerance grace" }
        4 { "Non-genuine grace" }
        5 { "Notification" }
        6 { "Extended grace" }
        default { "Unknown" }
    }
}

function CheckMicrosoftActivation {
    $global:optimizeErrors = 0
    Clear-Host
    Banner
    Glitch-Text "[EXOTICKIC] MICROSOFT LICENSE STATUS" 4
    System-Grid "License"
    Fake-Scan "License"
    Invoke-ProcessStages "LICENSE CHECK" 2

    try {
        $license = Get-CimInstance -ClassName SoftwareLicensingProduct -Filter "ApplicationID='55c92734-d682-4d71-983e-d6ec3f16059f' AND PartialProductKey IS NOT NULL" -ErrorAction Stop |
            Select-Object -First 1

        Write-Host ""
        if ($null -eq $license) {
            Write-Trace "INFO" "Windows license record not found"
        }
        else {
            $statusName = Get-LicenseStatusName $license.LicenseStatus
            Write-Trace "INFO" "PRODUCT  :: $($license.Name)"
            Write-Trace "INFO" "STATUS   :: $statusName"
            Write-Trace "INFO" "KEY      :: *****-$($license.PartialProductKey)"
            Write-Trace "INFO" "CHANNEL  :: official Microsoft licensing service"
        }
    }
    catch {
        $global:optimizeErrors++
        Write-Trace "SKIP" "license status unavailable" "DarkGreen"
    }

    Loading-Bar "LICENSE STATUS" 55
    Done-Effect "LICENSE CHECK"
}

function OpenMicrosoftActivationSettings {
    $global:optimizeErrors = 0
    Clear-Host
    Banner
    Glitch-Text "[EXOTICKIC] OPENING ACTIVATION SETTINGS" 4
    System-Grid "License"
    Fake-Scan "License"

    Invoke-SafeAction "license layer :: opening Windows Activation settings" {
        Start-Process "ms-settings:activation"
    }

    Loading-Bar "ACTIVATION SETTINGS" 45
    Done-Effect "LICENSE SETTINGS"
}

function ActivateWithOfficialKey {
    $global:optimizeErrors = 0
    Clear-Host
    Banner
    Glitch-Text "[EXOTICKIC] OFFICIAL KEY ACTIVATION" 5
    System-Grid "License"
    Fake-Scan "License"

    Write-Host ""
    Write-Host "   Official Microsoft product key required. Bypass/KMS/crack is not supported." -ForegroundColor DarkGreen
    Write-Host ""
    $key = Read-Host "license@exotickic:enter-product-key"
    $key = $key.Trim().ToUpper()

    if ($key -notmatch "^[A-Z0-9]{5}(-[A-Z0-9]{5}){4}$") {
        Write-Trace "SKIP" "invalid product key format" "DarkGreen"
        return
    }

    Invoke-ProcessStages "OFFICIAL ACTIVATION" 2
    Invoke-SafeAction "license layer :: installing official product key" {
        cscript.exe "$env:windir\System32\slmgr.vbs" /ipk $key
    }
    Invoke-SafeAction "license layer :: activating through Microsoft servers" {
        cscript.exe "$env:windir\System32\slmgr.vbs" /ato
    }

    Loading-Bar "OFFICIAL ACTIVATION" 75
    Done-Effect "LICENSE"
}

function MicrosoftActivationHelper {
    $inActivationMenu = $true
    while ($inActivationMenu) {
        Show-ActivationMenu
        $licenseChoice = Read-Host "license@exotickic:~#"

        switch ($licenseChoice) {
            "1" { CheckMicrosoftActivation; Pause-Internal }
            "2" { OpenMicrosoftActivationSettings; Pause-Internal }
            "3" { ActivateWithOfficialKey; Pause-Internal }
            "4" { $inActivationMenu = $false }
            default {
                Write-Host "command rejected :: unknown input" -ForegroundColor Green
                Start-Sleep -Seconds 1
            }
        }
    }
}

function SuperOptimize {
    $global:optimizeErrors = 0
    Clear-Host
    Banner
    Glitch-Text "[EXOTICKIC] SUPER ROOT SEQUENCE" 6
    Matrix-Rain
    System-Grid "Super"
    Fake-Scan "Super"
    Invoke-ProcessStages "SUPER ROOT" 4

    Invoke-SafeOptimizeActions "base layer ::"

    $services = @("DiagTrack", "SysMain", "WSearch")
    foreach ($service in $services) {
        Invoke-SafeAction "super layer :: disabling service profile :: $service" {
            Stop-Service $service -Force -ErrorAction Stop -WarningAction SilentlyContinue
            Set-Service $service -StartupType Disabled -ErrorAction Stop -WarningAction SilentlyContinue
        }
    }

    Invoke-SafeAction "super layer :: clearing prefetch cache" {
        Remove-Item -Path "C:\Windows\Prefetch\*" -Force -ErrorAction Stop
    }
    Invoke-SafeAction "super layer :: resetting tcp/ip stack" {
        netsh int ip reset
    }
    Invoke-SafeAction "super layer :: resetting winsock catalog" {
        netsh winsock reset
    }

    Loading-Bar "SUPER ROOT OPTIMIZE" 85
    Done-Effect "SUPER"
}

do {
    Show-MainMenu
    $choice = Read-Host "root@exotickic:~#"

    switch ($choice) {
        "1" {
            $inOptimizeMenu = $true
            while ($inOptimizeMenu) {
                Show-OptimizeMenu
                $optChoice = Read-Host "optimize@exotickic:~#"

                switch ($optChoice) {
                    "1" { Optimize; Pause-Internal }
                    "2" { SuperOptimize; Pause-Internal }
                    "3" { CacheSweep; Pause-Internal }
                    "4" { NetworkBoost; Pause-Internal }
                    "5" { ServiceTune; Pause-Internal }
                    "6" { SystemScan; Pause-Internal }
                    "7" { VirusScan; Pause-Internal }
                    "8" { MicrosoftActivationHelper }
                    "9" { $inOptimizeMenu = $false }
                    default {
                        Write-Host "command rejected :: unknown input" -ForegroundColor Green
                        Start-Sleep -Seconds 1
                    }
                }
            }
        }
        "2" { SystemScan; Pause-Internal }
        "3" { VirusScan; Pause-Internal }
        "4" { MicrosoftActivationHelper }
        "5" { break }
        default {
            Write-Host "command rejected :: unknown input" -ForegroundColor Green
            Start-Sleep -Seconds 1
        }
    }
} while ($true)
