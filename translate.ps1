$text = Get-Clipboard

$TargetLanguage = "en"
$Uri = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=$($TargetLanguage)&dt=t&q=$($text.Replace('#',''))"
$Response = Invoke-RestMethod -Uri $Uri -Method Get

$Translation = $Response[0].SyncRoot | foreach { $_[0]+"`r`n" }

write-host "##################"
write-host $Translation
write-host  "##################"
