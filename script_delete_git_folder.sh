#!/bin/bash

# Check if folder argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <folder_name>"
    exit 1
fi

# Check if authentication variables are set
if [ -z "$GIT_USERNAME" ] || [ -z "$GIT_TOKEN" ]; then
    echo "Error: Git username and token not set. Please set GIT_USERNAME and GIT_TOKEN environment variables."
    exit 1
fi

# Log in to the Git repository
git config --global user.email "$GIT_USERNAME"
git config --global user.name "$GIT_USERNAME"
git config --global credential.helper 'cache --timeout=3600'
echo -n "x-access-token:$GIT_TOKEN" | base64 -w0 | git credential-store store

# Take the first argument as folder name
folder_name="$1"
folder_path="inventory/$folder_name"

# Step 1: Delete folder
rm -rf "$folder_path"
git add .
git commit -m "Deleted folder $folder_path"

# ... Rest of the script


# Step 5: Open a pull request
# Note: You might need to do this manually via your Git hosting platform (e.g., GitHub, GitLab, etc.)