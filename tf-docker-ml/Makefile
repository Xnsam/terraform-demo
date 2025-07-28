.DEFAULT_GOAL = help
.PHONY: help init plan apply


help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


init:
	@cd terraform && terraform init

plan:
	@cd terraform && terraform plan

apply:
	@cd terraform && terraform apply

validate:
	@cd terraform && terraform validate


destroy:
	@cd terraform && terraform destroy

state:
	@cd terraform && terraform state list
