#!/usr/bin/env bash

# Compiles the generated Lua sources to Lua bytecode with luac.
# The output keeps the Java package directories so require("org.allbinary.string.CommonSeps") finds the compiled module with package.path set to <output>/?.lua
# Lua bytecode only loads in the same Lua version as the luac that compiled it.
# luac does not resolve require() so every require("a.b.C") is also checked against this project's sources and the
# unpacked META-INF/lua of the Maven dependencies so a missing dependency fails the build instead of failing at runtime.

set -uo pipefail

export PATH="/usr/local/bin:/usr/bin:/bin:$PATH"

source_dir="$(cygpath -u "$1")"
output_dir="$(cygpath -u "$2")"
luac="$3"
fail_on_error="$4"
dependency_dir=""
if [ "$#" -ge 5 ] && [ -n "$5" ]; then
    dependency_dir="$(cygpath -u "$5")"
fi
fail_on_missing_dependency="${6:-true}"

if [ ! -d "$source_dir" ]; then
    echo "No Lua sources: $source_dir"
    exit 0
fi

rm -rf "$output_dir"
mkdir -p "$output_dir"

compiled=0
failures=()

while IFS= read -r -d '' source; do
    relative_path="${source#"$source_dir"/}"
    output="$output_dir/$relative_path"
    mkdir -p "$(dirname "$output")"
    if "$luac" -o "$output" "$source"; then
        compiled=$((compiled + 1))
    else
        failures+=("$source")
    fi
done < <(find "$source_dir" -type f -name '*.lua' -print0 | sort -z)

echo "Lua modules compiled: $compiled"

declare -A module_found=()
missing=()
checked=0
require_pattern='require\("([^"]+)"\)'
while IFS= read -r line; do
    source="${line%%:*}"
    # Lua comments start with -- so a commented out require such as the Java library imports is not a dependency
    code="${line#*:}"
    code="${code%%--*}"
    while [[ $code =~ $require_pattern ]]; do
        module="${BASH_REMATCH[1]}"
        code="${code#*"${BASH_REMATCH[0]}"}"
        if [ -z "${module_found[$module]+set}" ]; then
            module_path="${module//.//}.lua"
            if [ -f "$source_dir/$module_path" ] || { [ -n "$dependency_dir" ] && [ -f "$dependency_dir/$module_path" ]; }; then
                module_found[$module]=1
            else
                module_found[$module]=0
            fi
            checked=$((checked + 1))
        fi
        if [ "${module_found[$module]}" = "0" ]; then
            missing+=("${source#"$source_dir"/} requires $module")
        fi
    done
done < <(find "$source_dir" -type f -name '*.lua' -print0 | sort -z | xargs -0 -r grep -HE 'require\("[^"]+"\)')

echo "Lua required modules checked: $checked"
status=0
if [ "${#missing[@]}" -gt 0 ]; then
    echo "Lua missing dependencies: ${#missing[@]} (not in $source_dir or ${dependency_dir:-<no dependency directory>})" >&2
    printf '  %s\n' "${missing[@]}" >&2
    if [ "$fail_on_missing_dependency" = "true" ]; then
        status=1
    fi
fi

if [ "${#failures[@]}" -gt 0 ]; then
    echo "Lua build failures: ${#failures[@]}" >&2
    printf '  %s\n' "${failures[@]}" >&2
    if [ "$fail_on_error" = "true" ]; then
        status=1
    fi
fi
exit $status
