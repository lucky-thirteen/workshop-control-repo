echo "Configuring SSH for Bolt Workshop..."
cat << EOF >> ~/.ssh/config
host github.com
 HostName github.com
 IdentityFile ~/.ssh/id_rsa_boltws
 StrictHostKeyChecking no
 User git
EOF

curl "https://raw.githubusercontent.com/kreeuwijk/workshop-control-repo/master/workshop_key.enc" -L -o ~/workshop_key.enc
rm -rf ~/.ssh/id_rsa_boltws
base64 --decode ~/workshop_key.enc > ~/.ssh/id_rsa_boltws
chmod 0600 ~/.ssh/id_rsa_boltws
ssh -oStrictHostKeyChecking=no -T git@github.com

echo "Done configuring SSH."
