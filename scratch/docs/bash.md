# Bash

## Using subcommands
Given `subcommand.sh` below, `subcommand.sh print` will invoke the `print()` function
```
print() {
	echo 'Hello, World!'
}

# Parse initial subcommand
# https://stackoverflow.com/questions/37257551/defining-subcommands-that-take-arguments-in-bash
if declare -f "$1" >/dev/null 2>&1; then
	# invoke that function, passing arguments through
	"$@" # same as "$1" "$2" "$3" ... for full argument list
else
	echo "Function $1 not recognized" >&2
	exit 1
fi
```

## Style
[Google's bash style guide](https://google.github.io/styleguide/shellguide.html)

## References
*	[$* and $@](https://eklitzke.org/bash-$*-and-$@)
