DEFAULT_GOAL := help

port ?= 5000

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
start: ## Start all endpoints
	@pushd ./root-html-file >/dev/null && (npx serve -s -l $$port &) && popd >/dev/null
	@pushd ./app1 >/dev/null && (npx vue-cli-service serve --port 8081 &) && popd >/dev/null
	@pushd ./app2 >/dev/null && (npx vue-cli-service serve --port 8082 &) && popd >/dev/null
	@pushd ./navbar >/dev/null && (npx vue-cli-service serve --port 8083 &) && popd >/dev/null

.PHONY: stop
stop: ## Stop all endpoints
	pkill -2 node
