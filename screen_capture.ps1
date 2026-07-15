Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$saveDir = "C:\Capture"
if (!(Test-Path $saveDir)) {
    New-Item -ItemType Directory -Path $saveDir | Out-Null
}

$endTime = (Get-Date).AddHours(2)

Write-Host "화면 캡처를 시작합니다."
Write-Host "저장 위치: $saveDir"
Write-Host "Ctrl+C를 누르면 언제든지 종료됩니다."

while ((Get-Date) -lt $endTime) {

    $bounds = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds
    $bitmap = New-Object System.Drawing.Bitmap $bounds.Width, $bounds.Height
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)

    $graphics.CopyFromScreen($bounds.Location, [System.Drawing.Point]::Empty, $bounds.Size)

    $filename = Join-Path $saveDir ("{0:yyyyMMdd_HHmmss}.png" -f (Get-Date))
    $bitmap.Save($filename, [System.Drawing.Imaging.ImageFormat]::Png)

    $graphics.Dispose()
    $bitmap.Dispose()

    Start-Sleep -Seconds 1
}

Write-Host "2시간이 경과하여 캡처를 종료했습니다."
