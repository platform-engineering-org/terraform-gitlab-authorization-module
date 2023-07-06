.PHONY: init plan up import

include .env
export

init:
	terraform init

plan:
	dotenv run terraform plan

up:
	dotenv run terraform apply

import:
	dotenv run terraform import gitlab_group.top_level_group $(TF_VAR_top_level_group_id)
