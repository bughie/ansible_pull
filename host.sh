cat << 'EOF' >> ~/.ssh/config

Host ansible-*
    User linuxadmin
    IdentityFile ~/.ssh/id_ed25519.pub
    StrictHostKeyChecking no
    UserKnownHostsFile /dev/null

Host web-server-1
    HostName 10.10.0.248 
    User ubuntu
    IdentityFile ~/.ssh/id_ed25519.pub

Host db-server-1
    HostName 10.10.0.244 
    User ubuntu
    IdentityFile ~/.ssh/id_ed25519.pub
EOF

chmod 600 ~/.ssh/config
