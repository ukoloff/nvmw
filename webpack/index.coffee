webpack = require 'webpack'
cmdize = require './cmdize'
ugly = require './ugly'

@entry =
  cli: "./src"
  setup: "./src/setup"
  upgrade: "./src/setup/upgrade"

@output =
  path: "tmp",
  filename: "[name].js"

values = (map)->
  v for k, v of map

@module =
  loaders: values
    coffee:
      test: /[.]coffee$/
      loader: "coffee"
    litcoffee:
      test: /[.](litcoffee|coffee[.]md)$/
      loader: "coffee?literate"
    cmds:
      test: /[.]cmds$/
      loader: 'coffee!cmds'

brk = (s)->
  s.split ' '

@resolve =
  extensions: brk " .js .coffee .litcoffee .coffee.md .cmds"

@resolveLoader =
  alias:
    cmds: require.resolve './cmds'

stringify = (rec)->
  res = {}
  for k, v of rec
    res[k] = switch typeof v
      when 'string'
        JSON.stringify v
      when 'object'
        stringify v
      else
        v
  res

@plugins = values
  ugly: new ugly
    output:
      max_line_len: 128
    compress:
      warnings: false
  cmdize: new cmdize
  defines: new webpack.DefinePlugin
    PACKAGE: stringify require '../package'
  globals: new webpack.ProvidePlugin require './autoload'
