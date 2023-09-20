# gitlab-configuration

## Badges

| Badge                   | Description          | Service      |
| ----------------------- | -------------------- | ------------ |
| ![Renovate][1]          | Dependencies         | Renovate     |
| ![Pre-commit][2]        | Static quality gates | pre-commit   |
| ![Devcontainer][3]      | Local DEV Env        | devcontainer |

[1]: https://img.shields.io/badge/renovate-enabled-brightgreen?logo=renovate
[2]: https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit
[3]: https://img.shields.io/static/v1?label=devcontainer&message=enabled&logo=visualstudiocode&color=007ACC&logoColor=007ACC

## DEV environment

* Use devcontainer to spin development environment
* Rename the templates files and populate the values:
  * backend.hcl.template -> backend.hcl
* Use the import make target to import pre-exising resources
* Execute the terraform plan:

```shell
make tf/init
make tf/plan
make tf/apply
```

or

```shell
make tf/init tf/plan tf/apply
```
