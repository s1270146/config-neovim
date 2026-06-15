# Use lualine.nvim

## Status
Accepted

## Context

Neovimにステータスバーを導入したい。

よく使われていて、LazyVimでも採用されているものを使いたい。
現在の設定ではlazy.nvimでプラグインを管理している。

Nerd Fontを使っているため、deviconsを使った表示も利用できる。

## Decision

ステータスバーとして`nvim-lualine/lualine.nvim`を導入する。

設定は`lua/plugins/lualine.lua`に置く。
初期設定は最小限にし、テーマは`auto`、ステータスラインは`globalstatus`を有効にする。

## Consequences

### Positive

- LazyVimでも使われているため、利用例が多い。
- lazy.nvimの既存構成に自然に追加できる。
- Nerd Fontとdeviconsを使った表示ができる。
- 初期設定が少なくても実用的に使える。

### Negative

- ステータスバー用プラグインが1つ増える。
- 表示項目を増やしすぎると設定が複雑になる。
- `globalstatus`により、ウィンドウごとのステータスラインではなく全体で1本の表示になる。

## Alternatives Considered

- mini.statusline
  - 小さく、既存のmini.tablineとは相性がよい。
  - ただしLazyVimで使われているものではない。
- Built-in statusline
  - プラグイン不要。
  - 見やすく保つには自前設定が増えやすい。

## Review Trigger

- lualine.nvimが未メンテナンスになる。
- Neovim本体のstatusline機能だけで十分になる。
- 設定が複雑になり、保守しにくくなる。
