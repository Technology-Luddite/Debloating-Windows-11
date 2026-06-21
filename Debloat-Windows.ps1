Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# --- Dynamic Path Resolution for Unknown Folder Locations ---
$DictionaryPath = Join-Path -Path $PSScriptRoot -ChildPath "win_hardening_defaults.json"

# --- Embedded App Array Framework ---
$DefaultAppsList = @"
Clipchamp.Clipchamp
Microsoft.3DBuilder
Microsoft.549981C3F5F10
Microsoft.BingFinance
Microsoft.BingFoodAndDrink
Microsoft.BingHealthAndFitness
Microsoft.BingNews
Microsoft.BingSports
Microsoft.BingTranslator
Microsoft.BingTravel
Microsoft.BingWeather
Microsoft.Getstarted
Microsoft.Messaging
Microsoft.Microsoft3DViewer
Microsoft.MicrosoftJournal
Microsoft.MicrosoftOfficeHub
Microsoft.MicrosoftPowerBIForWindows
Microsoft.MicrosoftSolitaireCollection
Microsoft.MicrosoftStickyNotes
Microsoft.MixedReality.Portal
Microsoft.NetworkSpeedTest
Microsoft.News
Microsoft.Office.OneNote
Microsoft.Office.Sway
Microsoft.OneConnect
Microsoft.Print3D
Microsoft.SkypeApp
Microsoft.Todos
Microsoft.WindowsAlarms
Microsoft.WindowsFeedbackHub
Microsoft.WindowsMaps
Microsoft.WindowsSoundRecorder
Microsoft.XboxApp
Microsoft.ZuneVideo
MicrosoftCorporationII.MicrosoftFamily
MicrosoftCorporationII.QuickAssist
MicrosoftTeams
MSTeams
ACGMediaPlayer
ActiproSoftwareLLC
AdobeSystemsIncorporated.AdobePhotoshopExpress
Amazon.com.Amazon
AmazonVideo.PrimeVideo
Asphalt8Airborne
AutodeskSketchBook
CaesarsSlotsFreeCasino
COOKINGFEVER
CyberLinkMediaSuiteEssentials
DisneyMagicKingdoms
Disney
DrawboardPDF
Duolingo-LearnLanguagesforFree
EclipseManager
Facebook
FarmVille2CountryEscape
fitbit
Flipboard
HiddenCity
HULULLC.HULUPLUS
iHeartRadio
Instagram
king.com.BubbleWitch3Saga
king.com.CandyCrushSaga
king.com.CandyCrushSodaSaga
LinkedInforWindows
MarchofEmpires
Netflix
NYTCrossword
OneCalendar
PandoraMediaInc
PhototasticCollage
PicsArt-PhotoStudio
Plex
PolarrPhotoEditorAcademicEdition
Royal
Shazam
Sidia.LiveWallpaper
SlingTV
Spotify
TikTok
TuneInRadio
Twitter
Viber
WinZipUniversal
Wunderlist
XING
"@

# --- Structural Bidirectional Dictionary Blueprint ---
$BidirectionalBlueprint = @{
    "Align_Taskbar_Left" = @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"; ValueName = "TaskbarAl"; Applied = 0; Default = 1; Type = "DWord" }
    "Disable_AI_Recall" = @{ Path = "HKCU:\Software\Policies\Microsoft\Windows\WindowsAI"; ValueName = "DisableAIDataAnalysis"; Applied = 1; Default = 0; Type = "DWord" }
    "Disable_Bing_Cortana_In_Search" = @{ Path = "HKCU:\Software\Policies\Microsoft\Windows\Explorer"; ValueName = "DisableSearchBoxSuggestions"; Applied = 1; Default = 0; Type = "DWord" }
    "Disable_Chat_Taskbar" = @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"; ValueName = "TaskbarMn"; Applied = 0; Default = 1; Type = "DWord" }
    "Disable_Copilot" = @{ Path = "HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot"; ValueName = "TurnOffWindowsCopilot"; Applied = 1; Default = 0; Type = "DWord" }
    "Disable_DVR" = @{ Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR"; ValueName = "AllowGameDVR"; Applied = 0; Default = 1; Type = "DWord" }
    "Disable_Desktop_Spotlight" = @{ Path = "HKCU:\Software\Policies\Microsoft\Windows\CloudContent"; ValueName = "DisableSpotlightCollectionOnDesktop"; Applied = 1; Default = 0; Type = "DWord" }
    "Disable_Enhance_Pointer_Precision" = @{ Path = "HKCU:\Control Panel\Mouse"; ValueName = "MouseSpeed"; Applied = "0"; Default = "1"; Type = "String" }
    "Disable_Lockscreen_Tips" = @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"; ValueName = "SubscribedContent-338387Enabled"; Applied = 0; Default = 1; Type = "DWord" }
    "Disable_Show_More_Options_Context_Menu" = @{ Path = "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32"; ValueName = ""; Applied = ""; Default = $null; Type = "KeyOverride" }
    "Disable_Start_Recommended" = @{ Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer"; ValueName = "HideRecommendedSection"; Applied = 1; Default = 0; Type = "DWord" }
    "Disable_Telemetry" = @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection"; ValueName = "AllowTelemetry"; Applied = 0; Default = 3; Type = "DWord" }
    "Disable_Widgets_Taskbar" = @{ Path = "HKLM:\SOFTWARE\Policies\Microsoft\Dsh"; ValueName = "AllowNewsAndInterests"; Applied = 0; Default = 1; Type = "DWord" }
    "Disable_Windows_Suggestions" = @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"; ValueName = "SystemPaneSuggestionsEnabled"; Applied = 0; Default = 1; Type = "DWord" }
    "Hide_Gallery_from_Explorer" = @{ Path = "HKCU:\Software\Classes\CLSID\{e88865ea-0e1c-4e20-9aa6-edcd0212c87c}"; ValueName = "System.IsPinnedToNameSpaceTree"; Applied = 0; Default = 1; Type = "DWord" }
    "Hide_Home_from_Explorer" = @{ Path = "HKCU:\Software\Classes\CLSID\{f874310e-b6b7-47dc-bc84-b9e6b38f5903}"; ValueName = "System.IsPinnedToNameSpaceTree"; Applied = 0; Default = 1; Type = "DWord" }
    "Launch_Explorer_To_This_PC" = @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"; ValueName = "LaunchTo"; Applied = 1; Default = 2; Type = "DWord" }
    "Show_Extensions_For_Known_File_Types" = @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"; ValueName = "HideFileExt"; Applied = 0; Default = 1; Type = "DWord" }
    "Show_Hidden_Folders" = @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"; ValueName = "Hidden"; Applied = 1; Default = 2; Type = "DWord" }
    "Hide_3D_Objects_Folder" = @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"; ValueName = ""; Applied = ""; Default = $null; Type = "KeyOverride" }
    "Hide_Onedrive_Folder" = @{ Path = "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"; ValueName = ""; Applied = ""; Default = $null; Type = "KeyOverride" }
    "Hide_duplicate_removable_drives" = @{ Path = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Desktop\NameSpace\DelegateFolders\{F5FB2C77-0E2F-4A16-A381-3E560C68BC83}"; ValueName = ""; Applied = ""; Default = $null; Type = "KeyOverride" }
    "Disable_Give_access_to_context_menu" = @{ Path = "HKCR:\*\shellex\ContextMenuHandlers\Sharing"; ValueName = ""; Applied = ""; Default = $null; Type = "KeyOverride" }
    "Disable_Include_in_library_from_context_menu" = @{ Path = "HKCR:\Folder\ShellEx\ContextMenuHandlers\Library Location"; ValueName = ""; Applied = ""; Default = $null; Type = "KeyOverride" }
    "Disable_Share_from_context_menu" = @{ Path = "HKCR:\*\shellex\ContextMenuHandlers\ModernSharing"; ValueName = ""; Applied = ""; Default = $null; Type = "KeyOverride" }
    "Hide_Search_Taskbar" = @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"; ValueName = "SearchboxTaskbarMode"; Applied = 0; Default = 1; Type = "DWord" }
    "Hide_Taskview_Taskbar" = @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"; ValueName = "ShowTaskViewButton"; Applied = 0; Default = 1; Type = "DWord" }
    "Disable_Error_Reporting" = @{ Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting"; ValueName = "Disabled"; Applied = 1; Default = 0; Type = "DWord" }
    "Disable_Tailored_Experiences" = @{ Path = "HKCU:\Software\Policies\Microsoft\Windows\CloudContent"; ValueName = "DisableTailoredExperiencesWithDiagnosticData"; Applied = 1; Default = 0; Type = "DWord" }
    "Disable_Advertising_ID" = @{ Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo"; ValueName = "Enabled"; Applied = 0; Default = 1; Type = "DWord" }
    "Disable_Inventory_Collector" = @{ Path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AppNameHistory"; ValueName = "TurnOffAppNameHistory"; Applied = 1; Default = 0; Type = "DWord" }
}

if (-not (Test-Path $DictionaryPath)) {
    $BidirectionalBlueprint | ConvertTo-Json -Depth 5 | Out-File -FilePath $DictionaryPath -Encoding UTF8
}
$ActiveDictionary = ConvertFrom-Json (Get-Content -Raw $DictionaryPath)

# --- Category Registration Interface Engine ---
$categories = [ordered]@{
    "Remove Default Provisioned Bloatware Apps" = @{ Target = "Apps Removal Block" }
    "Forcefully Uninstall Microsoft Edge & Stubs" = @{ Target = "Edge Removal Block" }
    "Purge and Reset Pinned Start Menu Shortcuts" = @{ Target = "Start Menu Purge Block" }
    "Disable Windows Copilot (AI Assistance)" = @{ Target = "Disable_Copilot" }
    "Disable Windows Recall Snapshots & Analytics" = @{ Target = "Disable_AI_Recall" }
    "Disable Global Operating System Telemetry" = @{ Target = "Disable_Telemetry" }
    "Disable Windows Suggestions, Ads & Prompts" = @{ Target = "Disable_Windows_Suggestions" }
    "Disable Bing and Cortana in Taskbar Search" = @{ Target = "Disable_Bing_Cortana_In_Search" }
    "Disable Widget Feeds & Remove Taskbar Icon" = @{ Target = "Disable_Widgets_Taskbar" }
    "Disable Xbox Game DVR Background Recording" = @{ Target = "Disable_DVR" }
    "Revert to Legacy Windows 10 Context Menu" = @{ Target = "Disable_Show_More_Options_Context_Menu" }
    "Align Desktop Taskbar Icons to Left Layout" = @{ Target = "Align_Taskbar_Left" }
    "Hide Search Bar Container from Taskbar" = @{ Target = "Hide_Search_Taskbar" }
    "Hide Task View Feature Button on Taskbar" = @{ Target = "Hide_Taskview_Taskbar" }
    "Hide Built-in Chat (Meet Now) Taskbar Hub" = @{ Target = "Disable_Chat_Taskbar" }
    "Force File Explorer Default Target to This PC" = @{ Target = "Launch_Explorer_To_This_PC" }
    "Reveal Hidden Files, Drives and Folders" = @{ Target = "Show_Hidden_Folders" }
    "Force Visibility of Known File Extensions" = @{ Target = "Show_Extensions_For_Known_File_Types" }
    "Hide Cloud OneDrive App Folder from Explorer" = @{ Target = "Hide_Onedrive_Folder" }
    "Hide Virtual 3D Objects Dynamic Folder" = @{ Target = "Hide_3D_Objects_Folder" }
    "Hide Gallery Content Feed from Navigation Pane" = @{ Target = "Hide_Gallery_from_Explorer" }
    "Hide Home Node Category from Navigation Pane" = @{ Target = "Hide_Home_from_Explorer" }
    "Hide Duplicate External Removable Storage Drives" = @{ Target = "Hide_duplicate_removable_drives" }
    "Remove Give Access To Options from Context Menu" = @{ Target = "Disable_Give_access_to_context_menu" }
    "Remove Include In Library Context Options" = @{ Target = "Disable_Include_in_library_from_context_menu" }
    "Remove Share Handler Option from Desktop Items" = @{ Target = "Disable_Share_from_context_menu" }
    "Disable Unproductive Lockscreen Tips & Tricks" = @{ Target = "Disable_Lockscreen_Tips" }
    "Disable Start Menu Recommended Feed Items" = @{ Target = "Disable_Start_Recommended" }
    "Disable Hardware Precision Mouse Acceleration" = @{ Target = "Disable_Enhance_Pointer_Precision" }
    "Disable Universal Windows Error Upload Reports" = @{ Target = "Disable_Error_Reporting" }
    "Disable Tailored Profile Diagnostic Experiences" = @{ Target = "Disable_Tailored_Experiences" }
    "Disable System App Advertising Tracking Tokens" = @{ Target = "Disable_Advertising_ID" }
    "Disable Operating System Inventory Collection" = @{ Target = "Disable_Inventory_Collector" }
}

# --- Engine Subroutines ---
function Invoke-AppRemoval {
    $appsList = $DefaultAppsList -split "`r?`n" | ForEach-Object { $_.Trim() } | Where-Object { $_ }
    $WinVersion = Get-ItemPropertyValue 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' CurrentBuild
    foreach ($app in $appsList) {
        $pattern = "*$app*"
        if ($WinVersion -ge 22000) {
            try { Get-AppxPackage -Name $pattern -AllUsers | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue } catch {}
        } else {
            try { Get-AppxPackage -Name $pattern | Remove-AppxPackage -ErrorAction SilentlyContinue } catch {}
        }
        try {
            Get-AppxProvisionedPackage -Online | Where-Object { $_.PackageName -like $pattern } | ForEach-Object {
                Remove-ProvisionedAppxPackage -Online -AllUsers -PackageName $_.PackageName
            }
        } catch {}
    }
    @("Microsoft.windowscommunicationsapps","Microsoft.People","Microsoft.OutlookForWindows","Microsoft.PowerAutomateDesktop","Microsoft.RemoteDesktop","Windows.DevHome","Microsoft.GamingApp","Microsoft.XboxGameOverlay","Microsoft.XboxGamingOverlay") | ForEach-Object {
        try { Get-AppxPackage -Name "*$_*" -AllUsers | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue } catch {}
    }
}

function Invoke-AppReinstallation {
    Get-AppxProvisionedPackage -Online | ForEach-Object {
        try { Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppxManifest.xml" -ErrorAction SilentlyContinue } catch {}
    }
}

function Invoke-EdgeRemoval {
    $regView = [Microsoft.Win32.RegistryView]::Registry32
    $hklm = [Microsoft.Win32.RegistryKey]::OpenBaseKey([Microsoft.Win32.RegistryHive]::LocalMachine, $regView)
    $hklm.CreateSubKey('SOFTWARE\Microsoft\EdgeUpdateDev').SetValue('AllowUninstall', '')
    $uninstallRegKey = $hklm.OpenSubKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge')
    if ($uninstallRegKey) {
        $uninstallString = $uninstallRegKey.GetValue('UninstallString') + ' --force-uninstall'
        Start-Process cmd.exe "/c $uninstallString" -WindowStyle Hidden -Wait
    }
}

function Invoke-EdgeReinstallation {
    $TargetWebPath = "$env:TEMP\MicrosoftEdgeSetup.exe"
    try {
        Invoke-WebRequest -Uri "https://msedge.sf.dl.delivery.mp.microsoft.com/filestreamingservice/files/microsoftedge/bootstrap/EdgeSetup.exe" -OutFile $TargetWebPath -ErrorAction SilentlyContinue
        if (Test-Path $TargetWebPath) {
            Start-Process -FilePath $TargetWebPath -ArgumentList "/silent /install" -Wait -WindowStyle Hidden
            Remove-Item $TargetWebPath -Force -ErrorAction SilentlyContinue
        }
    } catch {}
}

function Invoke-StartMenuReset {
    $startMenuBinFile = "$env:LOCALAPPDATA\Packages\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\LocalState\start2.bin"
    if (Test-Path $startMenuBinFile) {
        Copy-Item $startMenuBinFile ($startMenuBinFile + ".bak") -Force -ErrorAction SilentlyContinue
        Remove-Item $startMenuBinFile -Force -ErrorAction SilentlyContinue
    }
}

function Invoke-HostsOverride ([bool]$ApplyBlock) {
    $HostsPath = "C:\Windows\System32\drivers\etc\hosts"
    $Domains = @("v10.events.data.microsoft.com", "functional.events.data.microsoft.com", "self.events.data.microsoft.com")
    if (Test-Path $HostsPath) {
        $Content = Get-Content $HostsPath
        $NewContent = @()
        foreach ($line in $Content) {
            $matched = $false
            foreach ($domain in $Domains) { if ($line -match "127\.0\.0\.1\s+$domain") { $matched = $true } }
            if (-not $matched) { $NewContent += $line }
        }
        if ($ApplyBlock) {
            foreach ($domain in $Domains) { $NewContent += "127.0.0.1  $domain" }
        }
        Set-Content -Path $HostsPath -Value $NewContent -Force -ErrorAction SilentlyContinue
    }
}

# --- Form Interface Generation ---
$form = New-Object System.Windows.Forms.Form
$form.Text = "Windows 11 Privacy & Hardening Manager - Version: 1.0"
$form.Size = New-Object System.Drawing.Size(540, 600)
$form.StartPosition = "CenterScreen"
$form.FormBorderStyle = "FixedDialog"
$form.MaximizeBox = $false

$label = New-Object System.Windows.Forms.Label
$label.Text = "Optimize Windows 11: Remove pre-installed bloatware, tracking telemetry, integrated advertisements, and unsolicited data collection diagnostics."
$label.Location = New-Object System.Drawing.Point(20, 15)
$label.Size = New-Object System.Drawing.Size(480, 40)
$form.Controls.Add($label)

$panel = New-Object System.Windows.Forms.Panel
$panel.Location = New-Object System.Drawing.Point(20, 70)
$panel.Size = New-Object System.Drawing.Size(485, 390)
$panel.AutoScroll = $true
$panel.BorderStyle = [System.Windows.Forms.BorderStyle]::FixedSingle
$form.Controls.Add($panel)

$checkboxes = @{}
$yOffset = 10

foreach ($key in $categories.Keys) {
    $checkBox = New-Object System.Windows.Forms.CheckBox
    $checkBox.Text = $key
    $checkBox.Location = New-Object System.Drawing.Point(15, $yOffset)
    $checkBox.Size = New-Object System.Drawing.Size(430, 25)
    
    $targetKey = $categories[$key].Target
    $isChecked = $false
    
    if ($targetKey -notmatch "Block") {
        $node = $ActiveDictionary.$targetKey
        if ($node -and $node.Path -and (Test-Path $node.Path)) {
            $val = (Get-ItemProperty -Path $node.Path -Name $node.ValueName -ErrorAction SilentlyContinue).$($node.ValueName)
            if ($node.Type -eq "KeyOverride" -or $val -eq $node.Applied) { $isChecked = $true }
        }
    }
    
    $checkBox.Checked = $isChecked
    $panel.Controls.Add($checkBox)
    $checkboxes[$key] = $checkBox
    $yOffset += 32
}

$applyButton = New-Object System.Windows.Forms.Button
$applyButton.Text = "Apply Operations"
$applyButton.Location = New-Object System.Drawing.Point(135, 490)
$applyButton.Size = New-Object System.Drawing.Size(260, 35)

$NeedsRestartState = $false

$applyButton.Add_Click({
    if ($NeedsRestartState) {
        Restart-Computer -Force
        return
    }

    $ProgressPreference = 'SilentlyContinue'
    foreach ($key in $categories.Keys) {
        $targetKey = $categories[$key].Target
        
        if ($checkboxes[$key].Checked) {
            if ($targetKey -eq "Apps Removal Block") { Invoke-AppRemoval }
            elseif ($targetKey -eq "Edge Removal Block") { Invoke-EdgeRemoval }
            elseif ($targetKey -eq "Start Menu Purge Block") { Invoke-StartMenuReset }
            else {
                $node = $ActiveDictionary.$targetKey
                if ($node) {
                    if (-not (Test-Path $node.Path)) { New-Item -Path $node.Path -Force | Out-Null }
                    if ($node.Type -eq "KeyOverride") { New-Item -Path $node.Path -Force | Out-Null }
                    else { Set-ItemProperty -Path $node.Path -Name $node.ValueName -Value $node.Applied -Type $node.Type -Force | Out-Null }
                }
            }
        } else {
            if ($targetKey -eq "Apps Removal Block") { Invoke-AppReinstallation }
            elseif ($targetKey -eq "Edge Removal Block") { Invoke-EdgeReinstallation }
            elseif ($targetKey -notmatch "Block") {
                $node = $ActiveDictionary.$targetKey
                if ($node -and (Test-Path $node.Path)) {
                    if ($node.Type -eq "KeyOverride") { Remove-Item -Path $node.Path -Recurse -Force -ErrorAction SilentlyContinue }
                    else { Set-ItemProperty -Path $node.Path -Name $node.ValueName -Value $node.Default -Type $node.Type -Force | Out-Null }
                }
            }
        }
    }
    
    if ($checkboxes["Disable Global Operating System Telemetry"].Checked) {
        Get-Service -Name DiagTrack, dmwappushservice -ErrorAction SilentlyContinue | ForEach-Object {
            Stop-Service -InputObject $_ -Force -ErrorAction SilentlyContinue
            Set-Service -InputObject $_ -StartupType Disabled -ErrorAction SilentlyContinue
        }
        @("Consolidator", "UsbCeip") | ForEach-Object {
            Disable-ScheduledTask -TaskName $_ -TaskPath "\Microsoft\Windows\Customer Experience Improvement Program\" -ErrorAction SilentlyContinue | Out-Null
        }
        Invoke-HostsOverride -ApplyBlock $true
    } else {
        Get-Service -Name DiagTrack, dmwappushservice -ErrorAction SilentlyContinue | ForEach-Object {
            Set-Service -InputObject $_ -StartupType Automatic -ErrorAction SilentlyContinue
            Start-Service -InputObject $_ -ErrorAction SilentlyContinue
        }
        @("Consolidator", "UsbCeip") | ForEach-Object {
            Enable-ScheduledTask -TaskName $_ -TaskPath "\Microsoft\Windows\Customer Experience Improvement Program\" -ErrorAction SilentlyContinue | Out-Null
        }
        Invoke-HostsOverride -ApplyBlock $false
    }
    
    if ([Environment]::Is64BitProcess -eq [Environment]::Is64BitOperatingSystem) {
        Stop-Process -Name Explorer -Force -ErrorAction SilentlyContinue
    }
    
    $label.Text = "Restart required to finalize changes. DO NOT delete the win_hardening_defaults.json file, or rolling back changes will not be possible!"
    $label.ForeColor = [System.Drawing.Color]::Red
    $applyButton.Text = "Restart Computer Now"
    $applyButton.BackColor = [System.Drawing.Color]::LightCoral
    $applyButton.ForeColor = [System.Drawing.Color]::Black
    $NeedsRestartState = $true
})

$form.Controls.Add($applyButton)
[void]$form.ShowDialog()