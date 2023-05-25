# Usage: envsource <path/to/env>

function envsource
  for line in (cat .env | sed 's/^export //g' | grep -v '^#' | grep -v '^\s*$')
    set item (string split -m 1 '=' $line)
    set -gx $item[1] (string trim --chars=\'\" $item[2])
    echo "Exported key $item[1]"
  end
end

