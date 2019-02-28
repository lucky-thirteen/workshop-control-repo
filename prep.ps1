$ssh_config = '
host github.com
 HostName github.com
 IdentityFile ~/.ssh/id_rsa_boltws
 StrictHostKeyChecking no
 User git
'

Write-Host "Configuring SSH for Bolt Workshop..."
Add-Content -Value $ssh_config -Path ~/.ssh/config
iwr -Uri "https://raw.githubusercontent.com/kreeuwijk/workshop-control-repo/master/workshop_key.enc" -OutFile ~/workshop_key.enc
$content = Get-Content ~/workshop_key.enc
[System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($content)) | Out-File -Encoding "ASCII" ~/.ssh/id_rsa_boltws
"$(ssh -oStrictHostKeyChecking=no -T git@github.com 2>&1)"

Write-Host "Done configuring SSH."
