$fagkoder = "https://data.udir.no/kl06/v201906/fagkoder"
$fagtyper = "https://data.udir.no/kl06/v201906/fagtyper"
$fagomraader = "https://data.udir.no/kl06/v201906/fagomraader"
$fagkategorier = "https://data.udir.no/kl06/v201906/fagkategorier"
$aarstrinn = "https://data.udir.no/kl06/v201906/aarstrinn"
$enhetsok = "https://data-nsr.udir.no/v3/enheter/sok"


<#
$uri = "https://data.udir.no/kl06/v201906/fagkoder"
$uri = "https://data.udir.no/kl06/v201906/fagkoder"
$uri = "https://data.udir.no/kl06/v201906/fagkoder"

#>



 $fakoderres = Invoke-RestMethod -Uri $aarstrinn
 $fakoderres.SyncRoot | Out-GridView