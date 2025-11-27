function _tide_item_python
    # If pyenv is not installed, show nothing
    if not type -q pyenv
        return
    end

    # Get current pyenv version name, e.g. "fiserv312" or "system"
    set env (pyenv version-name 2>/dev/null)

    # Hide "system" so you only see real envs
    if test "$env" = "system"
        return
    end

    # Final appearance: "fiserv312 "
    echo -n "$env "
end