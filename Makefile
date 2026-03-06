# infra up
infra-up/dev:
	@echo "Starting dev environment..."
	vagrant up

infra-up/prod:
	@echo "Starting prod environment..."

# deploy
deploy/dev:
	@echo "Starting dev deployment..."
	( cd ansible && ansible-playbook -i inventories/dev -u vagrant playbooks/playbook-observability.yml -t grafana )

deploy/prod:
	@echo "Starting prod deployment..."
	ansible-playbook -i inventory/prod --ask-vault-pass playbook.yml