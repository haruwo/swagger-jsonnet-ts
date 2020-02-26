local sanitizePath(path) =
  if std.length(path) > 1 && std.endsWith(path, '/') then
    std.substr(path, 0, std.length(path) - 1)
  else
    path
;

{
  mount:: function(path, obj)
    {
      [sanitizePath(path + k)]: obj[k]
      for k in std.objectFields(obj)
    }
  ,

  noContent:: {
    responses: {
      '204': {
        description: 'No Content',
      },
    },
  },

  extractTags:: function(paths)
    std.map(
      function(name) { name: name },
      std.set([
        tag
        for path in std.objectFields(paths)
        for method in std.objectFields(paths[path])
        for tag in paths[path][method].tags
      ])
    ),
}
