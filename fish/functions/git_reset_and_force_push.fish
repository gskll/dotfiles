function git_reset_and_force_push
    # Verify that we have 2 arguments
    if test (count $argv) -ne 2
        echo -e "Usage: git_reset_and_push branchA branchB"
        return 1
    end

    set branchA $argv[1]
    set branchB $argv[2]

    # Switch to branch A
    echo -e "\nSwitching to branch $branchA"
    git checkout $branchA
    or begin
        echo -e "\nFailed to switch to branch $branchA"
        return 1
    end

    # Pull changes
    echo -e "\nPulling changes on branch $branchA"
    git pull
    or begin
        echo -e "\nFailed to pull changes on branch $branchA"
        return 1
    end

    # Switch to branch B
    echo -e "\nSwitching to branch $branchB"
    git checkout $branchB
    or begin
        echo -e "\nFailed to switch to branch $branchB"
        return 1
    end

    # Force reset B to A
    echo -e "\nResetting branch $branchB to $branchA"
    git reset --hard $branchA
    or begin
        echo -e "\nFailed to reset branch $branchB to $branchA"
        return 1
    end

    # Force push B
    echo -e "\nForce pushing branch $branchB"
    git push origin $branchB --force
    or begin
        echo -e "\nFailed to push changes to branch $branchB"
        return 1
    end

    echo -e "\nSuccessfully updated branch $branchB with changes from $branchA"

    return 0
end

