#!/bin/bash
if [ -z "$(git status --porcelain)" ]; then
  # Working directory clean
  quarto render
  git add --force docs/*
  git stash
  git checkout gh-pages
  git pull
  git rm -r docs
  git stash apply
  git commit
  git push
  git checkout main
else
  # Uncommitted changes
  echo "You have uncommitted changes."
fi
