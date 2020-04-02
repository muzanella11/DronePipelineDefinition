{
  dev: {
    event: 'push',
    branch: 'develop',
    tags:  ['dev-latest','dev-${DRONE_COMMIT_SHA:0:10}']
    },
  stg: {
    event: 'push',
    branch: ['staging/*'],
    tags: ['stg-latest','stg-${DRONE_COMMIT_SHA:0:10}']
    },
  prd: {
    event: 'tag',
    branch: 'master',
    tags: ['latest','v${DRONE_TAG}']
    },

  manualDeployDev: {
    event: 'promote',
    target: 'development',
    tag: 'dev-${DRONE_COMMIT_SHA:0:10}'
    },
  manualDeployStg: {
    event: 'promote',
    target: 'staging',
    tag: 'stg-${DRONE_COMMIT_SHA:0:10}'
    },
  manualDeployPrd: {
    event: 'promote',
    target: 'production',
    tag: 'v${DRONE_TAG}'
    },

  codeSanitize: {
    event: ['push','pull_request'],
    branch: {
      exclude: ['master','staging/*','develop','release/*']
      }
    },
}
