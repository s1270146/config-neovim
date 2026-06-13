# Manage Config With Git

## Status
Accepted

## Context

Neovim設定を長期的に育てたい。

## Decision

設定は ~/.config/nvim をGit管理する。

## Consequences

### Positive

- 変更履歴が残る
- Codexとの相性が良い

### Negative

- コミットの手間が増える

## Alternatives Considered

- Git管理しない

## Review Trigger

なし
