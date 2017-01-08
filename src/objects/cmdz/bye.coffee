exports.alias = 'boeing'

exports.title = "Uninstall #{PACKAGE.mingzi}"

exports.args = "[.]"

exports.help = """
  Totally remove #{PACKAGE.mingzi} manager and all installed Node.js versions.

  Without trailing dot command does nothing.
  """

exports.$ = (args)->
  unless period args
    echo """

      Say #{period.cmd} to really remove everything.
    """
    exit 1
  echo "Removing from PATH"
  addpath()
  echo "Removing files..."
  junction.drop()
  zog 'bye', ''
  echo """

    Fare thee well! and if for ever,
    Still for ever, fare thee well!

  """
