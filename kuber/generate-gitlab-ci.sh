#!/bin/bash

branch="${CI_COMMIT_BRANCH}"
environment="${branch}"

if [[ "$branch" == "main" ]]; then
  environment="prod"
fi

gitlabCI="deploy_server:
  stage: deploy
  environment: 
    name: ${environment}
  script:
  - ./kuber/deploy_server.sh ${CI_COMMIT_BRANCH}"

mkdir ./generated

echo "$gitlabCI" > ./generated/dynamic-gitlab-ci.yml