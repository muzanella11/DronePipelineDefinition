local utils = import '../functions/utils.libsonnet';

{
  gen(params = {
    projectName: null,
    event: null,
    branch: null,
    tagRefs: null,
  }):: {
    name: utils.generatePipelineName('submodule-%s' % [params.projectName], params.event, params.branch),
    image: 'docker:git',
    commands: ['git submodule update --init --recursive'],
    when: if (params.event == 'tag' && params.tagRefs == null) then {event: params.event}
          else if (params.event == 'tag' && params.tagRefs != null) then {event: params.event, ref: params.tagRefs}
          else {event: params.event, branch: params.branch}
  },
}
