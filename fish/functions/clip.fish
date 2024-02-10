function clip
    echo "Arguments count: (count $argv)"
    echo "First argument: '$argv[1]'"

    if test (count $argv) -eq 0
        echo "Usage: copyfiletoclip <path-to-file>"
        return 1
    else if not test -f "$argv[1]"
        echo "Error: File does not exist: $argv[1]"
        return 1
    else
        echo "Copying contents of $argv[1] to clipboard."
        cat -- "$argv[1]" | xclip -selection clipboard
        echo "Contents of $argv[1] copied to clipboard."
    end
end

