# infra up
infra-up/dev:
	@echo "Starting dev environment..."
	vagrant up

infra-up/prod:
	@echo "Starting prod environment..."

deploy/dev:
	@echo "Starting dev deployment..."
	( cd ansible && ansible-playbook -i inventories/dev -u vagrant playbooks/playbook.yml )

deploy-obs/dev:
	@echo "Starting dev deployment..."
	( cd ansible && ansible-playbook -i inventories/dev -u vagrant playbooks/playbook-observability.yml )

deploy/prod:
	@echo "Starting prod deployment..."
	( cd ansible && ansible-playbook -i inventories/prod playbooks/playbook-observability.yml )

init:
	@echo "Ansible prerequisites"
	( cd ansible && ansible-galaxy install -r ../requirements.yml )