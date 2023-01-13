$sh = New-Object -ComObject WScript.Shell

$startmenupath = 'c:\programdata\Microsoft\windows\Start Menu\Programs'

$templatepath = "$PSScriptRoot\TemplateStartMenu"

$original_elements = gci $startmenupath -Recurse

$new_elements = gci $templatepath -Recurse

$missing = (Compare-Object $new_elements $original_elements | where SideIndicator -eq "<=").Inputobject

$missing | % { 
    $ElementPath = ($_.Fullname | Split-Path -Parent) -replace [regex]::escape($templatepath),$startmenupath
    
    if ( (get-item $_.FullName) -isnot [System.IO.DirectoryInfo] )  {
        if ( test-path $ElementPath -ErrorAction SilentlyContinue) {
            $target = $sh.CreateShortcut($_.FullName).TargetPath
            if ( test-path $target ) {
                write-host "kopiere $($_.Name)"
                copy-item $_.FullName $ElementPath
            }
        }
    }
}
