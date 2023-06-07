function linecount -d "Counts the lines of code of a particular file extension in a git repository"
    set -l options (fish_opt -s d -l detail --optional-val)
    argparse $options -- $argv
    set -l extension $argv[1]

    if test -z $extension
        echo "Usage: linecount <extension> [-d|--detail]"
        return 1
    end

    set -l command "git ls-files | grep -e '\.$extension\$' | xargs wc -l"

    if set -q _flag_detail
        eval $command
    else
        set -l output (eval $command | tail -n 1)
        echo (string trim $output)
    end
end
