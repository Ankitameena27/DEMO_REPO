#!/bin/bash

# Check if folder argument is provided
if [ $# -eq 0 ]; then
    echo "Usage: $0 <folder_name>"
    exit 1
fi

# Set your Git username and token
git_username="your_username"
git_token="your_token"

# Take the first argument as folder name
folder_name="$1"
folder_path="inventory/$folder_name"

# Step 1: Delete folder
rm -rf "$folder_path"
git add .
git commit -m "Deleted folder $folder_path"

# Step 2: Configure Git to use username and token for authentication
git config credential.helper store
echo "https://$git_username:$git_token@github.com" | git credential approve

# Step 3: Create a new branch
new_branch_name="feature/delete-$folder_name"
git checkout -b "$new_branch_name"

# Step 4: Commit changes
git add .
git commit -m "Created branch and deleted folder"

# Step 5: Push the new branch to the remote repository
git push -u origin "$new_branch_name"

# Step 6: Open a pull request
# Note: You might need to do this manually via your Git hosting platform (e.g., GitHub, GitLab, etc.)

