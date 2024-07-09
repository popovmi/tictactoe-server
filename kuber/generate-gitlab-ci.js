const { writeFileSync } = require('fs');

const branch = process.env.CI_COMMIT_BRANCH;
const environment = branch === 'main' ? 'prod' : branch;

const gitlabCI = `
deploy_server:
  stage: deploy
  environment: ${environment}
  script:
  - ./kuber/deploy_server.sh $CI_COMMIT_BRANCH`;

writeFileSync('./dynamic-gitlab-ci.yml', gitlabCI);
