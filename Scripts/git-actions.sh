#!/bin/bash

echo "Below is a list of your github repositories:"

ls ~/git | nl

echo "Please type the (exact) name of the repository you want to work on:"

read repo_name

cd ~/git/$repo_name

git add .

echo "add a commit message:"

read commit_message

git commit -m "$commit_message"

git push origin main

echo "your work is complete!"
