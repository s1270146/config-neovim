# Use gitsigns.nvim and diffview.nvim

## Status
Accepted

## Context

Neovim上でGitの変更状態を確認しやすくしたい。

必要な条件は次の通り。

- ファイルを開いたときに追加、変更、削除された行がわかる。
- 未追跡ファイルでも変更状態を確認できる。
- 変更前と変更後を左右分割で比較できる。
- 複数ファイルの差分をNeovim上で確認できる。
- プラグイン管理は既存のlazy.nvimを使う。

Gitのcommit、stash、rebaseなどの操作はCLIで行う。

この設定は個人用であり、小さく、理解しやすく、保守しやすい状態を保ちたい。

## Decision

Gitの変更行表示には`lewis6991/gitsigns.nvim`を採用する。

Gitの左右差分比較には`sindrets/diffview.nvim`を採用する。

`gitsigns.nvim`は、開いているバッファの追加、変更、削除行をsigncolumnに表示するために使う。
また、hunkの移動、preview、buffer単位のdiff表示にも使う。

`diffview.nvim`は、作業ツリーや履歴の差分を左右分割で確認するために使う。
主に`:DiffviewOpen`と`:DiffviewFileHistory`を使う。

Git操作全般をNeovimに取り込む目的ではないため、`vim-fugitive`は導入しない。

## Consequences

### Positive

- ファイルを開くだけでGitの変更行を確認できる。
- 未追跡ファイルの変更状態も確認しやすくなる。
- 左右分割で差分を確認できる。
- commitなどの操作はCLIに残すため、Neovim側の責務を小さく保てる。
- 既存のlazy.nvim構成に自然に追加できる。

### Negative

- Git関連プラグインが2つ増える。
- `gitsigns.nvim`と`diffview.nvim`でdiff表示機能が一部重複する。
- `diffview.nvim`は専用tabpageを使うため、単純なbuffer操作より概念が増える。
- Gitの高度な操作はNeovim内では完結しない。

## Alternatives Considered

- `gitsigns.nvim`のみ
  - 変更行表示と現在ファイルのdiffには十分。
  - 複数ファイルを一覧しながら左右比較する用途には弱い。
- `diffview.nvim`のみ
  - 左右差分比較には十分。
  - ファイルを開いたときの行単位の変更表示には向かない。
- `nvim-mini/mini.diff`
  - 小さく、行単位の差分表示に使える。
  - 既存構成ではmini系を使っておらず、左右差分比較は主目的ではない。
- `tpope/vim-fugitive`
  - Git操作全般に強く、`:Gvdiffsplit`で左右比較もできる。
  - commit、stash、rebaseなどをCLIで行う方針では機能が過剰。

## Review Trigger

- Git関連のキーマップや設定が複雑になりすぎる。
- Neovim本体のdiff機能だけで十分になる。
- どちらかのプラグインが未メンテナンスになる。
- Git操作もNeovim内で完結したくなる。
