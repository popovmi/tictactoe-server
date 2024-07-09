const { writeFileSync } = require('fs');

const branch = process.env.CI_COMMIT_BRANCH;

const environment = branch === 'main' ? 'prod' : branch;

const gitlabCI = `image: docker:stable
services:
# we will build our images by running docker daemon inside a container
- docker:dind
variables:
  DOCKER_DRIVER: overlay2
  SERVER_DOCKER_IMAGE: popovmi/tictactoe-server

stages:
- deploy

deploy_server:
  stage: deploy
  environment: ${environment}
  script:
  - ./kuber/deploy_server.sh $CI_COMMIT_BRANCH`;

writeFileSync('./dynamic-gitlab-ci.yml', gitlabCI);
