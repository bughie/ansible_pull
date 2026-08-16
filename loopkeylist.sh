cat << 'EOF' > ~/servers.txt
10.10.0.244 
10.10.0.248 
10.10.0.247 
EOF

for server in $(cat ~/servers.txt); do
    ssh-copy-id -i ~/.ssh/ansible_key linuxadmin@$server
done
