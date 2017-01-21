# nvm$

[![Build status](https://ci.appveyor.com/api/projects/status/6o64oaxelmvrs25k?svg=true)](https://ci.appveyor.com/project/ukoloff/nvms)

Node Version Manager for M$ Windows.

Inspired by [nvmw][]
and [nvm-windows][]
(and of course [nvm][] itself),
but totally rewritten using
[Microsoft Scripting Host][Windows Script Host].

## Advantages

- Written in JavaScript itself (well, JScript)
- Adds single entry to PATH environment variable
- Creates `node.exe` for iojs distributions (along with `iojs.exe`)
- Generates console-less Node.js binary (`nodew.exe`)
- Can optionally install OpenSSL binary
- Detects availability of new versions of Node.js and itself

## Installation

If you have `git` installed:

  * git clone https://github.com/ukoloff/nvms.git -b dist
  * nvms/setup

If you have got no `git`
or don't like to use command prompt:

- Download https://github.com/ukoloff/nvms/raw/dist/bin/upgrade.bat
- Save it to any folder
- Run it
- It will download full distro, unpack and start installation

Finally, if your browser won't agree to download
batch files or run them afterwards,
you can do the job of `upgrade.bat` yourself:

- Download https://github.com/ukoloff/nvms/archive/dist.zip ([mirror][distro])
- Start downloaded `nvms-dist.zip` (in Explorer)
- Click `setup.bat`
- Windows will prompt to extract all files
- Agree
- Click `setup.bat` again

After installation you should close command prompt (if any)
and open new one to use `nvm$`.

## Update

For new version of `nvm$` to install
just repeat installation steps above.

This can be done with `nvm$ upgrade` command.

`nvm$` will periodically check its repo
to see whether new version exists
and prompt to update in that case.

To disable that check,
find file `%AppData%\nvm$\that\.v`
and insert into beginning some character
like `#` or `;` or even `-`.

## How it works

Fiddling environment variables may be tricky especially on Windows.
So, `nvm$` adds itself to PATH during setup
and then simply switch folder referred to by PATH.

Therefore all the processes of current user immediately see this change.
There is the only Node.js version active at any moment of time
(unlike `nvm`).

`nvm$` is always installed to a user,
it cannot be installed system-wide.

If Node.js is also normally installed
(for all users),
`nvm$` works,
but is in fact unusable
(system `node.exe` is always preferred),
so don't install them both.

Technically, for switching Node.js version
[NTFS junction point][] is used.
As there is no standard ActiveX control
for junction point manipulations,
command line utility `linkd`
from
Windows Server 2003 Resource Kit Tools
is used.

## Specifying Node.js version

Due to using JavaScript for processing,
it appeared possible
(and even easy)
to do exhaustive command line parsing.

For most commands,
where Node.js version should be specified,
it is possible to select
(in any set and order):

- Distribution (`node` or `iojs`)
- Platform (`x86` or `x64`)
- Version (`7` or `4.9` or may be `0.10.27`)

Any parameter can be abbreviated, eg `nvm$ i i`
is equivalent to `nvm$ install iojs`
(that is `nvm$ i 3`)
and `nvm$ o x8` means
`nvm$ openssl x86`.

Commands `nvm$ install` and `nvm$ use` select latest
(maximal)
of all possible versions,
while `nvm$ remove` deletes oldest
(minimal) one.

Therefore to install freshest Node.js
with default platform just type `nvm$ i`,
while `nvm$ i x6` installs
latest 64-bit version.

## Commands

### ls

List installed Node.js versions.
Filters apply, as mentioned earlier,
so `nvm$ l x8` will list only x86
installations.

### ls remote

List Node.js (and io.js) versions available
(fetches their lists from respective sites).
`nvm$ l r 4` will list all 4.\*.\* versions available.

### install

Install latest of specified Node.js versions.
One can select platform (`x86` or `x64`)
or default will be used.

If specified version is installed,
it will be [used](#use),
so it is safe to run `nvm$ i`
to ensure the latest version in installed.

To force reinstallation, add `.`
to the end of command,
eg `nvm$ i .` will reinstall
latest version unconditionally.

### use

Switch to latest of installed versions
(filters apply).
Eg `nvm$ use` means switch to latest of all,
while `nvm$ use i` to latest of iojs.

Run `nvm$ use none` to temporarily make node.exe
unavailable,
you can switch back at any moment later.

### which

Shows path to active version,
or path to Junction point
in case `nvm$ use none` was fired.

### remove

Remove oldest of installed versions
considering command line filter.

For security reasons,
`.` must occur at the end of
this command,
or else it will refuse to proceed.

Eg, `nvm$ d .` (`drop` is alias for `remove`)
will remove one (minimal) version.
`nvm$ d all i .` will remove all iojs versions.

Actual removing of files
can take much time,
so it is performed in background.
Don't logoff or turn off your computer
a minute or two after this command finished.

### Additional commands

#### openssl

Node.js versions 0.\*.\* contains `openssl` binary.
`nvm$` can download it and install
into its PATH.

Like `install` command,
platform can be specified.
Other filters (version number for instance)
are meaningless and ignored.

#### abbrev

Helps to find comman abbreviation(s).
Eg, run `nvm$ a w` to see all commands,
starting with `w` and their alternatives.

Plain `nvm$ a` shows *all* abbreviations.

#### upgrade

Downloads latest version of `nvm$` itself
and installs it.

To upgrade Node.js, run `nvm$ i` (for [install](#install)).

#### www

Opens `nvm$` repository in default browser.

#### bye

Fully uninstall `nvm$` itself along with
all Node.js versions.

Like [remove](#remove) command,
requires `.` to proceed
and take some (*more*) time
for actual files removal
(may be 10 minutes or so).

## Credits

  * [Node.js][]
  * [io.js][]
  * [Windows Script Host][]
  * [nvm][]
  * [nvmw][]
  * [nvm-windows][]
  * [Windows Sysinternals][]
  * [webpack][]
  * [cmdizer][]
  * [AppVeyor][]

[Node.js]: http://nodejs.org/
[io.js]: https://iojs.org/
[Windows Script Host]: https://en.wikipedia.org/wiki/Windows_Script_Host
[nvm]: https://github.com/creationix/nvm
[nvmw]: https://github.com/hakobera/nvmw
[nvm-windows]: https://github.com/coreybutler/nvm-windows
[Windows Sysinternals]: https://technet.microsoft.com/en-US/en-en/nternals/
[webpack]: http://webpack.github.io/
[cmdizer]: http://www.dostips.com/forum/viewtopic.php?p=37780#p37780
[NTFS junction point]: https://en.wikipedia.org/wiki/NTFS_junction_point
[AppVeyor]: http://www.appveyor.com/
[distro]: https://ci.appveyor.com/api/projects/ukoloff/nvms/artifacts/nvm%24.zip?branch=master
[dev-distro]: https://ci.appveyor.com/api/projects/ukoloff/nvms/artifacts/nvm%24dev.zip?branch=master
