# Use nvim-tree.lua

## Status
Accepted

## Context

NeovimにVSCode風のファイルエクスプローラーを追加したい。

必要な条件は次の通り。

- `<leader>e`で開閉できる。
- ファイルアイコンを表示できる。
- 子ディレクトリを階層移動せずツリー内で展開できる。
- Git未追跡、変更状態を表示できる。
- 隠しファイルの表示/非表示を切り替えられる。
- lazy.nvimで管理できる。

この設定は個人用であり、小さく、理解しやすく、保守しやすい状態を保ちたい。

## Decision

ファイルエクスプローラーとして`nvim-tree/nvim-tree.lua`を採用する。

アイコン表示のために`nvim-tree/nvim-web-devicons`を依存として追加する。

プラグイン設定は`lua/plugins/nvim-tree.lua`に置き、`<leader>e`で`NvimTreeToggle`を実行する。

dotfilesは初期状態では非表示にし、nvim-treeのデフォルトマッピングで表示/非表示を切り替える。

Git状態はファイル名の色と文字アイコンで表示する。

- 未追跡、未ステージ変更は緑で表示する。
- ステージ済み変更はオレンジで表示する。
- GitアイコンはVSCodeの表示に寄せて`U`、`M`、`A`、`R`、`D`などの文字を使う。

nvim-tree内のディレクトリ操作は次のキーマップを使う。

- `.`: カーソル上のディレクトリをルートにする。
- `<BS>`: 一階層上をルートにする。
- `l`: カーソル上のノードを開く。
- `h`: カーソル上または親のディレクトリを閉じる。

## Consequences

### Positive

- VSCode風のサイドバー型エクスプローラーを小さい設定で導入できる。
- ツリー内でディレクトリを展開できる。
- Git状態や隠しファイル切り替えを扱える。
- ディレクトリ移動を少ないキー操作で扱える。
- lazy.nvimの既存構成に自然に追加できる。

### Negative

- アイコン表示にはNerd Fontが必要になる。
- netrwを無効化するため、Neovim標準のディレクトリエクスプローラーは使わなくなる。
- `neo-tree.nvim`ほど多機能ではない。
- Git状態の文字アイコンはVSCodeと完全に同じ表示ではなく、近い意味の文字表現になる。

## Alternatives Considered

- `nvim-neo-tree/neo-tree.nvim`
  - 多機能で拡張性が高い。
  - 今回の要件にはやや大きい。
- `stevearc/oil.nvim`
  - ファイル操作体験は良い。
  - VSCode風サイドバーではない。
- `nvim-mini/mini.files`
  - 小さく保ちやすい。
  - ツリー型サイドバーではなく、Git状態表示も主目的ではない。

## Review Trigger

- エクスプローラー設定が複雑になりすぎる。
- Git状態表示や隠しファイル切り替えで不足が出る。
- `nvim-tree.lua`が未メンテナンスになる。
- より小さい、またはNeovim標準の代替で十分になる。
