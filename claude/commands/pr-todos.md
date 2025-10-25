---
description: Extract action items from PR comments into a TODO list
---

# Pull Request TODO Generator

You are tasked with analyzing GitHub Pull Request comments and creating a structured TODO list of action items.

## Instructions

1. **Get PR Number**:
   - If the user provided a PR number as an argument (e.g., `/pr-todos 123`), use that number
   - If no PR number was provided, ask the user for it

2. **Fetch PR Comments**:
   - Use `gh pr view <PR_NUMBER> --json comments --jq '.comments[] | "\(.author.login) (\(.createdAt)):\n\(.body)\n---"'` to get all comments
   - For review comments, use the GitHub API directly: `gh api repos/{owner}/{repo}/pulls/<PR_NUMBER>/comments --jq '.[] | "\(.user.login) (\(.created_at)) [Line \(.line // .original_line)]:\n\(.body)\n---"'`
   - Note: The review comments from `--json reviews` often don't include the body text for inline comments, so use the API endpoint instead
   - You may need to extract the owner and repo from the current repository first using: `gh repo view --json owner,name --jq '"\(.owner.login)/\(.name)"'`

3. **Analyze Comments**:
   - Look for action items, requests, suggestions, and tasks
   - Identify comments that contain:
     - Direct requests (e.g., "Can you...", "Please...", "Could you...")
     - Suggestions (e.g., "Consider...", "Maybe...", "What about...")
     - Issues to fix (e.g., "This should...", "Need to...", "Don't forget...")
     - Questions that require code changes or investigation
     - Unresolved discussions

4. **Create TODO List**:
   - Use the TodoWrite tool to create a structured TODO list
   - Group related items together
   - Set all items as "pending" initially
   - Use clear, actionable task descriptions in imperative form
   - Include the commenter's name in the task for context
   - Provide appropriate activeForm for each task

5. **Present Results**:
   - Show a summary of how many comments were found
   - Display the generated TODO list
   - Indicate if no action items were found

## Example Output Format

When presenting the TODO list to the user, include:
- Total number of comments analyzed
- Number of action items identified
- The structured TODO list with proper status tracking

## Notes

- Skip comments that are just approvals, acknowledgments, or resolved discussions
- Focus on actionable items that require code changes or responses
- If a comment thread is resolved, you may skip those items
- Combine duplicate or very similar action items
