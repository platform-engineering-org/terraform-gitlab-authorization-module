import gitlab
import urllib3
import dotenv
import os
import urllib.parse


def codeowners_enabled(project):
    codeowners_filelist = [
        f for f in project.repository_tree(get_all=True) if f["name"] == "CODEOWNERS"
    ]
    return len(codeowners_filelist) != 0


def main():
    dotenv.load_dotenv()

    parsed = urllib.parse.urlparse(os.getenv("TF_VAR_base_url"))

    gitlab_url = f"{parsed.scheme}://{parsed.netloc}"
    private_token = os.getenv("TF_VAR_token")

    gl = gitlab.Gitlab(url=gitlab_url, private_token=private_token)

    group = gl.groups.get(id=12786)
    for p in group.projects.list(include_subgroups=True, get_all=True):
        project = gl.projects.get(p.id, lazy=True)
        if not codeowners_enabled(project):
            print(
                f"CODEOWNERS is not enabled for repo {p.namespace['full_path']}/{p.name}"
            )
        else:
            print(f"CODEOWNERS is enabled for repo {p.namespace['full_path']}/{p.name}")

        for pb in project.protectedbranches.list():
            branch = project.branches.get(pb.name)
            if branch.developers_can_merge or branch.developers_can_push:
                print(
                    f"Developer permissions to push or merge is enabled for repo {p.name} on branch: {pb.name}"
                )


if __name__ == "__main__":
    main()
