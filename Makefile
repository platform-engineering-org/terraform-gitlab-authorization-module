.PHONY: all clean test

ENV := dev
TERRAGRUNT_CMD = cd live/${ENV} && terragrunt run-all --terragrunt-non-interactive

.PHONY: tf/init
tf/init:
	${TERRAGRUNT_CMD} init -backend-config=backend.hcl

.PHONY: tf/plan
tf/plan:
	${TERRAGRUNT_CMD} plan

.PHONY: tf/apply
tf/apply:
	${TERRAGRUNT_CMD} apply

.PHONY: tf/import
import:
	dotenv run terraform import gitlab_group.top_level_group $(TF_VAR_top_level_group_full_path)
	dotenv run terraform import gitlab_user.bot_user $(TF_VAR_gitlab_bot_user)
