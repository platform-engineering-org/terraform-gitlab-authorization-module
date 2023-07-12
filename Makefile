.PHONY: all clean test init plan apply import

include .env
export

init:
	terraform init -backend-config=backend.hcl

plan:
	dotenv run terraform plan

apply:
	dotenv run terraform apply

import:
	dotenv run terraform import gitlab_group.top_level_group $(TF_VAR_top_level_group_full_path)
	dotenv run terraform import gitlab_user.bot_user $(TF_VAR_gitlab_bot_user)

all: clean init plan

clean:
	rm -f terraform.tfstate

test: plan
