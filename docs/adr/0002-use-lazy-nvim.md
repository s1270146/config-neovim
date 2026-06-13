# Use lazy.nvim

## Status
Accepted

## Context

Neovim設定にプラグインを導入したい。

以前はLazyVimを使っていたため、lazy.nvimの設定モデルには慣れている。

一方で、この設定はディストリビューションを目指さない。
小さく、理解しやすく、保守しやすい設定にしたい。

## Decision

プラグインマネージャとしてlazy.nvimを使う。

ただし、lazy.nvimの機能をすべて積極的に使うのではなく、次の方針で使う。

- プラグインは必要になったときだけ追加する。
- Neovim組み込み機能で十分な場合はプラグインを追加しない。
- プラグイン定義は小さく保つ。
- 遅延読み込みは読みやすさを損なわない範囲で使う。
- `lazy-lock.json` はGit管理する。
- プラグイン追加、削除、置き換えはADRに残す。

## Consequences

### Positive

- LazyVim経験を活かせる。
- lockfileにより、プラグインのバージョンを再現しやすい。
- 依存関係、更新、遅延読み込みを一つの仕組みに任せられる。
- プラグインが増えた場合も設定を分割しやすい。

### Negative

- 小さな設定には機能が多い。
- lazy.nvim固有のプラグイン定義に依存する。
- 遅延読み込みを細かくしすぎると、設定が読みにくくなる。
- プラグイン追加の心理的コストが下がり、設定が肥大化しやすい。

## Alternatives Considered

- Neovim built-in packages
  - 外部プラグインマネージャが不要で最小。
  - インストール、更新、lockfile、依存関係管理を自分で扱う必要がある。
- vim-plug
  - 単純で安定している。
  - Neovim Lua中心の設定ではlazy.nvimほど自然ではない。
- mini.deps
  - 小さく、方針には合う。
  - lazy.nvimより利用事例と周辺情報が少ない。
- paq-nvim
  - 小さく、Luaで書ける。
  - lockfileや高度な管理機能はlazy.nvimより弱い。
- pckr.nvim
  - packer.nvimの後継として使える。
  - 新規採用ではlazy.nvimほど強い理由がない。
- packer.nvim
  - 以前は定番だった。
  - 現在は未メンテナンスのため新規採用しない。

## Review Trigger

- lazy.nvimが未メンテナンスになる。
- Neovim本体や別の小さい仕組みで十分になる。
- プラグイン定義が複雑になり、保守しにくくなる。
- lockfile運用が負担になる。
