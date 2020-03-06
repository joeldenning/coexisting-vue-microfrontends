DEFAULT_GOAL := help

.PHONY: help
help:
	@echo
	@echo Implementing Python Microservices with OpenID-Connect/OAuth2
	@echo
	@fgrep "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/:.*## / - /'
	@echo

.PHONY: install
install: ## Install all dependencies
	@pushd ./root-html-file >/dev/null && (npm install &) && popd >/dev/null
	@pushd ./app1 >/dev/null && (npm install &) && popd >/dev/null
	@pushd ./app2 >/dev/null && (npm install &) && popd >/dev/null
	@pushd ./navbar >/dev/null && (npm install &) && popd >/dev/null

.PHONY: clean
clean: ## Clean all endpoints
	rm */node_modules -rf

.PHONY: start
start: install ## Start all endpoints
	@pushd ./root-html-file >/dev/null && (npx serve -s -l 3000 &) && popd >/dev/null
	@pushd ./app1 >/dev/null && (npx vue-cli-service serve --port 4001 &) && popd >/dev/null
	@pushd ./app2 >/dev/null && (npx vue-cli-service serve --port 4002 &) && popd >/dev/null
	@pushd ./navbar >/dev/null && (npx vue-cli-service serve --port 4003 &) && popd >/dev/null

.PHONY: stop
stop: ## Stop all endpoints
	pkill -2 node
