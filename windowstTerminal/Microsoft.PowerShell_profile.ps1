$enn:YAZI_CONFIG_PATH = "$env:USERPROFILE\.config\yazi\config\"

function y {
    $tmp = [System.IO.Path]::GetTempFileName()
    yazi $args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if (-not [String]::IsNullOrEmpty($cwd) -and $cwd -ne $PWD.Path) {
        Set-Location -LiteralPath ([System.IO.Path]::GetFullPath($cwd))
    }
    Remove-Item -Path $tmp
}

function desk {
    Set-Location "$env:USERPROFILE\Desktop"
}

function ob {
    Set-Location "$env:USERPROFILE\Documents\Obsidian Baules\Notas Personales"
}

function son {
    Set-Location "$env:USERPROFILE\Code_\Web\Pry_1"
    nvim .
}

Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
