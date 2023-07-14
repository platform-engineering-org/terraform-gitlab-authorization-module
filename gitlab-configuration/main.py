import gitlab
import urllib3
import dotenv
import os
import urllib.parse

def main():
    dotenv.load_dotenv()

    parsed = urllib.parse.urlparse(os.getenv('TF_VAR_base_url'))

    gitlab_url = f"{parsed.scheme}://{parsed.netloc}"
    private_token = os.getenv('TF_VAR_token')

    gl = gitlab.Gitlab(url=gitlab_url, private_token=private_token)

    group = gl.groups.get(id=12786)
    for p in group.projects.list(include_subgroups=True, get_all=True):
        project = gl.projects.get(p.id, lazy=True)
        for pb in project.protectedbranches.list():
            branch = project.branches.get(pb.name)
            if branch.developers_can_merge or branch.developers_can_push:
                print(p.name, pb.name)


if __name__ == "__main__":
    main()
