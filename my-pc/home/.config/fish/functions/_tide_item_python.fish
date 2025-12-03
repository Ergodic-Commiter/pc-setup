# $tide_pyenv_show_system... [1]: |true| set in universal scope, unexported, with 1 elements
# $tide_python_bg_color... [1]: |585858| set in universal scope, unexported, with 1 elements
# $tide_python_color... [1]: |00AFAF| set in universal scope, unexported, with 1 elements
# $tide_python_format... [1]: |{name} {icon}| set in universal scope, unexported, with 1 elements
# $tide_python_icon... [1]: |󰌠| set in universal scope, unexported, with 1 elements
# $tide_python_show_version_name... [1]: |true| set in universal scope, unexported, with 1 elements
# $tide_python_version_name_only... [1]: |true| set in universal scope, unexported, with 1 elements

# function _tide_item_python
#     if test -n "$VIRTUAL_ENV"
#         if command -q python3
#             python3 --version | string match -qr "(?<v>[\d.]+)"
#         else
#             python --version | string match -qr "(?<v>[\d.]+)"
#         end
#         string match -qr "^.*/(?<dir>.*)/(?<base>.*)" $VIRTUAL_ENV
#         # pipenv $VIRTUAL_ENV looks like /home/ilan/.local/share/virtualenvs/pipenv_project-EwRYuc3l
#         # Detect whether we are using pipenv by looking for 'virtualenvs'. If so, remove the hash at the end.
#         if test "$dir" = virtualenvs
#             string match -qr "(?<base>.*)-.*" $base
#             _tide_print_item python $tide_python_icon' ' "$v ($base)"
#         else if contains -- "$base" virtualenv venv .venv env # avoid generic names
#             _tide_print_item python $tide_python_icon' ' "$v ($dir)"
#         else
#             _tide_print_item python $tide_python_icon' ' "$v ($base)"
#         end
#     else if path is .python-version Pipfile __init__.py pyproject.toml requirements.txt setup.py
#         if command -q python3
#             python3 --version | string match -qr "(?<v>[\d.]+)"
#         else
#             python --version | string match -qr "(?<v>[\d.]+)"
#         end
#         _tide_print_item python $tide_python_icon' ' $v
#     end
# end

function _tide_item_python
    # Try pyenv first
    set -l env ''

    if type -q pyenv
        set env (pyenv version-name 2>/dev/null)
    end

    # If we have a real pyenv env (not "system"), show env name
    if test -n "$env" -a "$env" != "system"
        # icon first, then env name
        _tide_print_item python $tide_python_icon' ' $env
        return
    end

    # No pyenv env active → show Python version (major.minor)
    set -l version_output ''

    if command -q python3
        set version_output (python3 --version)
    else if command -q python
        set version_output (python --version)
    else
        return
    end

    # Extract version number into $v_full (like 3.12.2)
    # Works with outputs like: "Python 3.12.2"
    string match -qr "Python (?<v_full>[\d.]+)" $version_output

    # Extract major.minor → e.g. 3.12
    string split . $v_full | read major minor patch

    # Build short version (major.minor)
    set -l v_short "$major.$minor"

    _tide_print_item python $tide_python_icon' ' $v_short
end