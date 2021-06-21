"`n======================================================="
"== CHECK FOR Microsoft Windows Unquoted Service Path =="
"=======================================================`n"
"Enumeration of potentially vulnerable paths:"
$v1 = ((Get-WmiObject win32_service | ?{$_.Name -like '*'}).PathName -notmatch '^\s*\"')
foreach($t in $v1){
	if((Split-Path -Path ($t)).Trim() | Select-String -pattern ' ') {
		$t
	}
}
"`n"
