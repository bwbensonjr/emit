# Print the body of one version's CHANGELOG.md section; exit 1 when it is missing or empty.
# Usage: awk -v version=X.Y.Z -f tools/changelog-section.awk CHANGELOG.md
# Accepts `## X.Y.Z`, `## [X.Y.Z]`, and `## [X.Y.Z] - date` headings. Every other `## ` heading,
# such as `## Unreleased`, ends or skips a section, so it never reaches release notes.
/^## / { if (found) exit; if ($0 == "## [" version "]" || $0 == "## " version || index($0, "## [" version "] - ") == 1) { found=1; next } }
found { print; if ($0 ~ /[^[:space:]]/) content=1 }
END { if (!found || !content) exit 1 }
