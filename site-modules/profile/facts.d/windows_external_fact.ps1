# External facts provide a way to use arbitrary executables or scripts as facts, or set facts statically with structured data.
# The external facts interface expects Windows scripts to end with a known extension. Line endings can be either LF or CRLF. The following extensions are supported:
#   .com and .exe: binary executables
#   .bat and .cmd: batch scripts
#   .ps1: PowerShell scripts 

$ruby = (where.exe ruby 2>$null | Select-Object -First 1)
if ($ruby) { Write-Output "rubypath=$ruby" }
$rubyVersion = ((ruby -v 2>$null) -split '\s+' | Select-Object -Index 1)
if ($rubyVersion) { Write-Output "rubyversion=$rubyVersion" }
