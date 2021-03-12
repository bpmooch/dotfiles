#!/bin/bash
set -e
set -u

usage() {
	echo -n "pg.sh [OPTION]...
 Thin wrapper around psql that simplifies my primary use cases
 Options:
  -c, --config      Supply config file, by default checks for \$PWD/.env
  -f, --file        Execute a sql file, printing the results
  -h, -?, --help    Display this help and exit

 All the variables in the supplied config file will be exported. The
 following vars are used when available:

 HOST
 PORT
 DATABASE
 USER
 PASSWORD
"
}

ARGS=("psql" "--set" "AUTOCOMMIT=off" "--set" "ON_ERROR_STOP=on")
build_command() {
	if [ -n "$DATABASE" ]; then
		ARGS+=("-d" "$DATABASE")
	fi

	if [ -n "$HOST" ]; then
		ARGS+=("-h" "$HOST")
	fi

	if [ -n "$PORT" ]; then
		ARGS+=("-p" "$PORT")
	fi

	if [ -n "$USER" ]; then
		ARGS+=("-U" "$USER")
	fi

	if [ -n "${FILENAME:-}" ]; then
		ARGS+=("-f" "$FILENAME")
	fi
}

psql_run() {
	build_command
	if [ -n "$PASSWORD" ]; then
		PGPASSWORD="$PASSWORD" "${ARGS[@]}"
	else
		"${ARGS[@]}"
	fi
	exit "$?"
}

check_env() {
	# config flag location
	if [ -n "${CONFIG:-}" ] && [ -a "$CONFIG" ]; then
		# check extension
		# if .yaml, yq
		# else
		set -o allexport
		# shellcheck source=/dev/null
		source "$CONFIG"
		set +o allexport
		return 0
	fi

	# check .env
	echo "No config supplied, checking $PWD/.env for config"
	if [ -a "$PWD/.env" ]; then
		set -o allexport
		# shellcheck source=/dev/null
		source "$PWD/.env"
		set +o allexport
		return 0
	fi

	echo "No valid config found"
	usage
	exit 1
}

# POSIX.1-2017
#
# 12.2 Utility Syntax Guidelines
#
# Guideline 10:
#
# The first -- argument that is not an option-argument
# should be accepted as a delimiter indicating the end of
# options. Any following arguments should be treated
# as operands, even if they begin with the '-' character.

PARAMS=""
while (("$#")); do
	case "$1" in
	-h | -\? | --help)
		usage
		exit 1
		;;
	-c | --config)
		if [ -n "$2" ] && [ "${2:0:1}" != "-" ]; then
			CONFIG=$2
			shift 2
		else
			echo "Error: Argument for $1 is missing" >&2
			exit 1
		fi
		;;
	-f | --file)
		if [ -n "$2" ] && [ "${2:0:1}" != "-" ]; then
			FILENAME=$2
			shift 2
		else
			echo "Error: Argument for $1 is missing" >&2
			exit 1
		fi
		;;
	--*= | -*) # unsupported flags
		echo "Error: Unsupported flag $1" >&2
		exit 1
		;;
		# we don't actually care about positional args, maybe remove
	*) # preserve positional arguments
		PARAMS="$PARAMS $1"
		shift
		;;
	esac
done

check_env
psql_run
