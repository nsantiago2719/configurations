---
name: git-commit
description: Create a consistent commit message using a template.
license: MIT
compatibility: opencode
---

## What I do

- Generate a commit message based on a template.
- Ensure the commit message follows a consistent format.
- Provide suggestions for improving the commit message if necessary.
- If there are no staged changes, prompt the user to stage changes before creating a commit message or ask the user if they want to stage all changes and create a commit message.

## When to use me

Whenever commiting changes to a codebase, especially in a collaborative environment where consistent commit messages are important for readability and project management.
**ALWAYS** ask for verification before finalizing the commit message to ensure it accurately reflects the changes made and adheres to the project's guidelines.

## Format rules
Commit message should follow the format:
```
feat|fix|docs|style|refactor|test|chore(scope): short description
```

## Examples
```
feat(auth): add user login functionality
fix(api): resolve issue with data fetching
docs: update README with installation instructions
style: format code according to style guidelines
```
