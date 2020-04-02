local utils = import '../functions/utils.libsonnet';

{
  gen(params = {
    stepName: null,
    projectName: null,
    event: null,
    branch: null,
    image: null,
    envVars: null,
    commands: [],
    tagRefs: null
  }):: {
    name: utils.generatePipelineName('%s-%s' % [params.stepName,params.projectName], params.event, params.branch),
    image: params.image,
    environment: if (params.envVars == null) then{} else params.envVars,
    commands: params.commands,
    when: if (params.event == 'tag' && params.tagRefs == null) then {event: params.event}
          else if (params.event == 'tag' && params.tagRefs != null) then {event: params.event, ref: params.tagRefs}
          else {event: params.event, branch: params.branch}
  }
}
