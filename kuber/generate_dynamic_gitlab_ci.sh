#!/bin/bash

if [[ $CI_COMMIT_BRANCH == "main" ]]; then
  ENVIRONMENT="prod"
else
  ENVIRONMENT=$CI_COMMIT_BRANCH
fi

gitlabCI="deploy_server:
  stage: deploy
  environment: 
    name: $ENVIRONMENT
  script:
  - kuber/deploy_server.sh $ENVIRONMENT"

mkdir generated

echo $gitlabCI > $DYNAMIC_GITLAB_CI_FILE
