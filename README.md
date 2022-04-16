# Daelon's Fork

This is a great package, but I needed slightly more than zero comprimise on the formatting style.

## Differences:

- prefer ' instead of "
- 1 line between sections instead of 2
- adjusted whitespace inside function signatures


## Installation:

To install this project you need `python3` and `pip`. 

I strongly recommend using [pipx](https://github.com/pypa/pipx) to install python packages as system-level tools.

```
pipx install git+https://github.com/DaelonSuzuka/godot-gdscript-toolkit.git
```

## Additional Tools:

KuhnChrisEU's [vscode-formatter-godot](https://marketplace.visualstudio.com/items?itemName=KuhnChrisEU.vscode-formatter-godot) plugin for VSCode works properly with this fork, giving you access to gdformat in the usual manner.

The following python snippet will find every `*.gd` file in the current directory or any subdirectory and format it. This can be useful to format your entire project at once when installing these tools.

```py
from pathlib import Path
import subprocess

files = ' '.join([f.as_posix() for f in Path('.').rglob('*.gd')])
subprocess.call(f"gdformat {files}", shell=True)
```


# GDScript Toolkit
[![](https://github.com/Scony/godot-gdscript-toolkit/workflows/Tests/badge.svg?branch=master)](https://github.com/Scony/godot-gdscript-toolkit/actions)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Code style: black](https://img.shields.io/badge/code%20style-black-000000.svg)](https://github.com/psf/black)

This project provides a set of tools for daily work with `GDScript`. At the moment it provides:

- A parser that produces a parse tree for debugging and educational purposes.
- A linter that performs a static analysis according to some predefined configuration.
- A formatter that formats the code according to some predefined rules.

## Installation

To install this project you need `python3` and `pip`. 

Use this command to install `gdtoolkit` for `Godot 3` from PyPI repository:

```
pip3 install 'gdtoolkit==3.*'
```

Alternatively, you can install latest (potentially unstable) version directly from git:
```
pip3 install git+https://github.com/Scony/godot-gdscript-toolkit.git
```

## Linting with gdlint [(more)](https://github.com/Scony/godot-gdscript-toolkit/wiki/3.-Linter)

To run a linter you need to execute `gdlint` command like:

```
$ gdlint misc/MarkovianPCG.gd
```

Which outputs messages like:

```
misc/MarkovianPCG.gd:96: Error: Function argument name "aOrigin" is not valid (function-argument-name)
misc/MarkovianPCG.gd:96: Error: Function argument name "aPos" is not valid (function-argument-name)
```

## Formatting with gdformat [(more)](https://github.com/Scony/godot-gdscript-toolkit/wiki/4.-Formatter)

**Formatting may lead to data loss, so it's highly recommended to use it along with Version Control System (VCS) e.g. `git`**

To run a formatter you need to execute `gdformat` on the file you want to format. So, given a `test.gd` file:

```
class X:
	var x=[1,2,{'a':1}]
	var y=[1,2,3,]     # trailing comma
	func foo(a:int,b,c=[1,2,3]):
		if a in c and \
		   b > 100:
			print('foo')
func bar():
	print('bar')
```

when you execute `gdformat test.gd` command, the `test.gd` file will be reformatted as follows:

```
class X:
	var x = [1, 2, {'a': 1}]
	var y = [
		1,
		2,
		3,
	]  # trailing comma

	func foo(a: int, b, c = [1, 2, 3]):
		if a in c and b > 100:
			print('foo')


func bar():
	print('bar')
```

## Parsing with gdparse [(more)](https://github.com/Scony/godot-gdscript-toolkit/wiki/2.-Parser)

To run a parser you need to execute the `gdparse` command like:

```
gdparse tests/valid-gd-scripts/recursive_tool.gd -p
```

The parser outputs a tree that represents your code's structure:

```
start
  class_def
    X
    class_body
      tool_stmt
      signal_stmt	sss
  class_def
    Y
    class_body
      tool_stmt
      signal_stmt	sss
  tool_stmt
```

## Development [(more)](https://github.com/Scony/godot-gdscript-toolkit/wiki/5.-Development)

Everyone is free to fix bugs or introduce new features. For that, however, please refer to existing issue or create one before starting implementation.
