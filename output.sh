#!/bin/sh
zeitgeist_ip=$(cd terraform && terraform output -raw zeitgeist-ip)
logging_ip=$(cd terraform  && terraform output -raw logging-ip)
monitoring_ip=$(cd terraform  && terraform output -raw monitoring-ip)

cat > ansible/hosts << EOL
[zeitgeist]
${zeitgeist_ip} ansible_ssh_private_key_file=/Users/admin/.ssh/id_rsa ansible_user=joseph ansible_ssh_common_args='-o StrictHostKeyChecking=no'

[Logging]
${logging_ip} ansible_ssh_private_key_file=/Users/admin/.ssh/id_rsa ansible_user=joseph ansible_ssh_common_args='-o StrictHostKeyChecking=no'

[Monitoring]
${monitoring_ip} ansible_ssh_private_key_file=/Users/admin/.ssh/id_rsa ansible_user=joseph ansible_ssh_common_args='-o StrictHostKeyChecking=no'
EOL