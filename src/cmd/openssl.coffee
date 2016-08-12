exports.title = 'Install OpenSSL utility'

exports.args = "[x86|x64]"

exports.help = """
  Install openssl.exe precompiled for Node.js project
  """

exports.cmd = (args)->
  for r in remotes.list().reverse() when semver.match r.id, [[0]]
    x = r
    break
  throw Error 'Appropriate Node.js version not found!' unless x
  x64 = '6' == RegExp.$1 if /^x(\d)/i.test arg = args[0]
  r.openssl x64
