up:
	@cd ansible && ansible-playbook playbooks/hostname.yml
	# @cd ansible && ansible-playbook playbooks/docker.yml
	@cd ansible && ansible-playbook playbooks/promtail.yml
	# @cd ansible && ansible-playbook playbooks/deploy_pag.yml