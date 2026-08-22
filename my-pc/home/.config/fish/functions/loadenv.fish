function loadenv
    for line in (cat .env | grep -v '^#' | grep -v '^$')
        set -gx (string split -m1 '=' $line)
    end
end
