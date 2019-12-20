## Comment API on Pull Request

```sh
export ACCESS_TOKEN=
export REPO_OWNER=
export REPO_NAME=
export PR_NUMBER=
curl -s -H "Authorization: token ${ACCESS_TOKEN}" \
 -X POST -d '{"body": "Test Message"}' \
 "https://api.github.com/repos/${REPO_OWNER}/${REPO_NAME}/issues/${PR_NUMBER}/comments"
```

[Create comment on pull request](https://stackoverflow.com/a/51959932)
