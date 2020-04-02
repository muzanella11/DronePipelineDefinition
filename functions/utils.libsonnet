local trimPipelineName(name) = if std.length(name) > 50 then std.substr(name, 0, 50) else name;

local generatePipelineName(name, event, branch) = '[%s]::[%s]::[%s]' %
[
  name,
  if std.isArray(event)
    then std.join(',', event)
    else event,
  if std.isArray(branch)
    then std.join(',', branch)
  else if (branch == {exclude: ['master','staging/*','develop','release/*']})
    then std.join(',', branch.exclude)
    else branch,
];

local generate50CharPipelineName(name, event, branch) = '%s' % trimPipelineName(generatePipelineName(name, event, branch));

{
  generatePipelineName(name, event, branch):: generate50CharPipelineName(name, event, branch),
  generate50CharPipelineName(name, event, branch):: generate50CharPipelineName(name, event, branch)
}
