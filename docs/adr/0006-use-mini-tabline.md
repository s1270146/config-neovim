# Use mini.tabline

## Status
Accepted

## Context

バッファ移動と削除は既存のキーマップで運用している。

- `H`: previous buffer
- `L`: next buffer
- `<leader>bd`: delete buffer

操作体系は変えず、上部に現在のバッファ状態を簡単に表示したい。

LazyVim のような豪華な UI は不要だが、開いているバッファを視覚的に把握できる表示はほしい。
使用フォントは Nerd Font のため、アイコン表示も利用できる。

この設定は小さく、理解しやすく、保守しやすく保つ方針である。

## Decision

上部のバッファ表示には `nvim-mini/mini.tabline` を使う。

設定は最小限にし、既存のバッファ操作キーマップは変更しない。
アイコンは表示する。

## Consequences

### Positive

- 既存の操作体系を維持できる。
- バッファ一覧を上部で確認できる。
- `bufferline.nvim` や `barbar.nvim` より機能が小さく、設定方針に合う。
- Nerd Font 環境ではファイルアイコンを表示できる。
- 複数 tabpage がある場合も簡単な表示に対応できる。

### Negative

- LazyVim の `bufferline.nvim` ほどリッチな表示や操作はない。
- アイコン表示はフォントやアイコン provider に依存する。
- 専用のバッファ削除や並べ替え機能は追加しない。

## Alternatives Considered

- Neovim built-in `tabline`
  - 依存追加なしで最小。
  - バッファ一覧表示やクリック対応を自作する必要があり、設定が複雑になりやすい。
- `akinsho/bufferline.nvim`
  - LazyVim に近い見た目と機能を提供する。
  - 今回の要件には機能が多く、設定が大きくなりやすい。
- `romgrk/barbar.nvim`
  - バッファ操作や close/pick/sort が充実している。
  - 既存操作を維持して簡単な表示だけ行う目的には大きい。

## Review Trigger

- `mini.tabline` が未メンテナンスになる。
- Neovim 組み込み機能だけで十分な表示を簡単に実現できるようになる。
- バッファ操作や表示要件が増え、より高機能な bufferline が必要になる。
- アイコン表示の依存関係が保守負担になる。
