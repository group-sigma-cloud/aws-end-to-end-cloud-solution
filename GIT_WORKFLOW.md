# GROUP SIGMA
# Git & GitHub Collaboration Workflow

## 1. Purpose

This document defines the standard Git and GitHub workflow for the Group Sigma AWS End-to-End Cloud Solution project.

It establishes consistent practices for version control, feature development, code reviews, automated validation, and collaboration.

## 2. Branch Management Strategy

The project uses three categories of branches:

| Branch | Purpose |
|---|---|
| `main` | Stable, reviewed, release-ready code |
| `develop` | Integration branch for approved development work |
| `feature/*` | Individual features, improvements, and fixes |

**Important:** Team members should not commit directly to `main` or `develop`. Changes must be submitted through feature branches and pull requests.

## 3. Creating a Feature Branch

Before starting new work, ensure your working tree is clean.

Use the automated branch creation script:

```powershell
.\scripts\create-feature.ps1 -FeatureName update-homepage
```

This script:
- Checks the working tree.
- Switches to `develop`.
- Retrieves the latest changes.
- Creates a new feature branch.

Example:

`feature/update-homepage`

## 4. Making and Committing Changes

Make the required application, infrastructure documentation, or configuration changes.

Use the automated commit script:

```powershell
.\scripts\commit-changes.ps1 -Message "feat: describe your changes"
```

Commit messages should be clear and descriptive.

Recommended prefixes:

- `feat:` New functionality
- `fix:` Bug fixes
- `docs:` Documentation updates
- `ci:` Continuous Integration changes
- `refactor:` Code restructuring
- `test:` Testing improvements

## 5. Pushing Changes to GitHub

Use the automated push script:

```powershell
.\scripts\push-feature.ps1
```

The script checks that:
- The current branch is a feature branch.
- The working tree is clean.
- The branch can be pushed to the remote repository.

## 6. Pull Request and Peer Review Process

All feature work must follow this process:

1. Push the feature branch to GitHub.
2. Open a pull request targeting `develop`.
3. Provide a clear title and description.
4. Explain the changes and testing performed.
5. Request a review from another team member.
6. Address any review feedback.
7. Confirm that required automated checks pass.
8. Merge after the review and required checks are complete.

For a project release, create a separate pull request from `develop` into `main`.

## 7. Continuous Integration (GitHub Actions)

The project uses GitHub Actions to automate application validation.

Workflow location:

`.github/workflows/ci.yml`

The workflow runs when:
- Changes are pushed to `develop`.
- Changes are pushed to feature branches.
- Pull requests target `develop` or `main`.
- The workflow is manually triggered.

Automated checks include:

- Required website files.
- HTML asset references.
- HTML section references.
- Project documentation files.

The workflow uses:

`scripts/validate_site.py`

Team members should confirm that the workflow completes successfully before merging changes.

## 8. Local Application Validation

Before submitting application changes, run:

```powershell
python scripts/validate_site.py
```

The validation script checks that the required HTML, CSS, and JavaScript files exist and that local references and section links are valid.

All checks should pass before submitting a pull request.

## 9. Security and Collaboration Rules

Every team member must follow these practices:

- Never commit AWS access keys, passwords, tokens, or private credentials.
- Use feature branches for individual contributions.
- Keep commit messages descriptive.
- Request peer reviews before merging.
- Address review feedback professionally.
- Synchronize with `develop` before starting new work.
- Keep project documentation updated.
- Retain genuine GitHub Actions and pull request evidence.

## 10. Project Automation Scripts

The following automation tools are maintained in the `scripts/` directory.

| Script | Function |
|---|---|
| `create-feature.ps1` | Creates a feature branch from updated `develop` |
| `commit-changes.ps1` | Automatically stages and commits changes |
| `push-feature.ps1` | Pushes the current feature branch to GitHub |
| `validate_site.py` | Validates website files and HTML references |

## 11. Evidence and Project Records

The team should maintain evidence of its development process, including:

- Feature branches and commit history.
- Pull requests and peer reviews.
- Successful GitHub Actions workflow runs.
- Application validation results.
- Updated project documentation.
- Relevant AWS infrastructure screenshots.

Only genuine project activities and verified results should be presented as evidence.

## 12. Conclusion

This workflow provides Group Sigma with a consistent approach to collaborative software development.

By combining Git branching, automated PowerShell scripts, peer reviews, and GitHub Actions, the team can improve code quality, maintain a clear development history, and demonstrate practical version-control and Continuous Integration skills.

**Project:** Group Sigma – AWS End-to-End Cloud Solution

**Repository:** https://github.com/group-sigma-cloud/aws-end-to-end-cloud-solution

**Live Application:** https://d94v8pn8slf9f.cloudfront.net