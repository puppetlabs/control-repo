# External facts provide a way to use arbitrary executables or scripts as facts, or set facts statically with structured data.
# The external facts interface expects Windows scripts to end with a known extension. Line endings can be either LF or CRLF. The following extensions are supported:
#   .com and .exe: binary executables
#   .bat and .cmd: batch scripts
#   .ps1: PowerShell scripts 

Write-Host "rubypath=$(where ruby)"
Write-Host "rubyversion=$(ruby -v | ForEach-Object { $_.Split(' ')[1] })"
