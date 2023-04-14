$bkSkoler = 'https://data-nsr.udir.no/v3/enheter/kommune/3024'
$skolekategorier = 'https://data-nsr.udir.no/v3/skolekategorier'

$skolkat = Invoke-RestMethod -Uri $skolekategorier

$skkategori = ($skolkat | Out-GridView -PassThru | select -First 1).id

$skolekategori = "https://data-nsr.udir.no/v3/enheter/skolekategori/$($skkategori)"
$skoleravKat = Invoke-RestMethod -Uri $skolekategori

$skoler = Invoke-RestMethod -Uri $bkSkoler


$json = '{ "skolekategoriId": "1",  "kommunenr": "3024",  "inkluderNedlagte": false,  "inkluderAktive": true,  "inkluderSkoler": true,  "inkluderEiere": true,  "inkluderAndreEnheter": true }'
$json2 = '{ "skolekategoriId": "1", "kommunenr": "3024", "inkluderNedlagte": false, "inkluderAktive": true, "inkluderSkoler": true, "inkluderEiere": true, "inkluderAndreEnheter": true }'
$json3 = '{ "kommunenr": "1149", "inkluderNedlagte": false, "inkluderAktive": true, "inkluderSkoler": true, "inkluderEiere": true, "inkluderAndreEnheter": false }'
$karmoy = Invoke-RestMethod -Uri "https://data-nsr.udir.no/v3/enheter/sok" -Method Post -Headers @{"accept"="application/xml"; "Content-Type" = "application/json"} -ContentType "application/json-patch+json" -Body $json3
Invoke-RestMethod -Uri "https://data-nsr.udir.no/v3/enheter/sok" -Method Post -Headers @{"accept"="application/xml"; "Content-Type" = "application/json"} -ContentType "application/json-patch+json" -Body $json2

$karmoy.ArrayOfNsrEnhetTinyApiModel.NsrEnhetTinyApiModel

<#
curl -X 'GET' \
  'https://data-nxr-fellestjeneste.udir.no/api/v1/kommunedata?datotid=2023-03-05' \
  -H 'accept: application/xml'



{ "skolekategoriId": "1",  "kommunenr": "3024",  "inkluderNedlagte": false,  "inkluderAktive": true,  "inkluderSkoler": true,  "inkluderEiere": true,  "inkluderAndreEnheter": true }

curl -X 'POST' \ 'https://data-nsr.udir.no/v3/enheter/sok' \
 -H 'accept: text/plain' \
 -H 'Content-Type: application/json-patch+json' \
 -d '{ "skolekategoriId": "1", "kommunenr": "3024", "inkluderNedlagte": false, "inkluderAktive": true, "inkluderSkoler": true, "inkluderEiere": true, "inkluderAndreEnheter": true }'

curl -X 'POST' \
  'https://data-nsr.udir.no/v3/enheter/sok' \
  -H 'accept: application/xml' \
  -H 'Content-Type: application/json-patch+json' \
  -d '{
  "skolekategoriId": "1",
  "kommunenr": "3024",
  "inkluderNedlagte": false,
  "inkluderAktive": true,
  "inkluderSkoler": true,
  "inkluderEiere": true,
  "inkluderAndreEnheter": true
}'


#>