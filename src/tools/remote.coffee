###
Methods of remote [Node.js version]
###

exports.ver = ->
  "#{@dist}-#{@src.version}-x#{if @x64 then 64 else 86}"

exports.msi = (full)->
  r = "#{@ver()}.msi"
  if full
    fs.BuildPath cache, r
  else
    r

exports.uri = (file = @msi false)->
  "#{dists[@dist]}#{@src.version}/#{
    if @x64 and not @id[0][0]
      'x64/'
    else
      ''
    }#{file}"

exports.fetch = ->
  echo "Fetching <#{uri = @uri()}>..."
  ajax.dl uri, @msi true

exports.extract = ->
  echo "Extracting #{@msi()}..."
  if fs.FolderExists extract2 = fs.BuildPath cache, ver = @ver()
    fs.DeleteFolder extract2
  sh.Run """
    msiexec /a "#{@msi true}" TARGETDIR=#{extract2} /passive
    """, 1, true
  if fs.FolderExists @dst = dst = fs.BuildPath install2, ver
    fs.DeleteFolder dst
  fs.MoveFolder each(fs.GetFolder(extract2).SubFolders).shift().Path, dst
  fs.DeleteFolder extract2

exports.shortcuts = ->
  echo "Creating shortcuts..."

  if 'node' != @dist
    fs.CopyFile fs.BuildPath(@dst, "#{@dist}.exe"),
      fs.BuildPath(@dst, "node.exe")

exports.prefix = ->
  echo "Adjusting NPM prefix..."
  npmrc = fs.OpenTextFile fs.BuildPath(@dst, 'node_modules/npm/npmrc'), 8
  npmrc.WriteLine """

    # <hack dirty src="#{PACKAGE.homepage}">
    prefix=${APPDATA}\\#{PACKAGE.mingzi}\\#{fs.GetBaseName junction.link}
    # </hack>
    """
  npmrc.Close()

exports.use = ->
  echo "Using #{ver = @ver()}..."
  junction.exec ver

exports.install = (is64)->
  @x64 = is64 ? x64
  @fetch()
  @extract()
  @shortcuts()
  @prefix()
  @use()

exports.openssl = (is64)->
  @x64 = is64 ? x64
  echo "Fetching <#{uri = @uri cli = bat.openssl}>..."
  ajax.dl uri, fs.BuildPath install2, cli
  echo "Creating shortcut..."
  bat fs.GetBaseName junction.link
