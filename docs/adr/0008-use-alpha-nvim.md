# Use alpha-nvim

## Status
Proposed

## Context

`nvim .`で起動したときに空のバッファではなく、起動画面を表示したい。

起動画面には、少なくとも次の項目を表示したい。

- Open File
- Open Folder

この設定は個人用であり、小さく、理解しやすく、保守しやすい状態を保ちたい。

既にファイルエクスプローラーとして`nvim-tree.lua`を採用しているため、ディレクトリを開く操作は既存の`nvim-tree.lua`を利用できる。

## Decision

起動画面プラグインとして`goolord/alpha-nvim`を採用する。

`alpha-nvim`は`lua/plugins/alpha.lua`で設定する。

起動画面には次のアクションを置く。

- `Open File`: `nvim-tree.lua`を開き、UI上でファイルを選択する。
- `Open Folder`: `nvim-tree.lua`を開き、UI上でディレクトリを選択する。
- `Quit`: Neovimを終了する。

`nvim ./<ディレクトリ名>/`で起動した場合は、既存の`nvim-tree.lua`設定でディレクトリを開く。

Telescopeは現時点では導入しない。

将来Telescopeを導入した場合は、`alpha-nvim`の`Open File`アクションをTelescopeのファイル選択UIに差し替えることを検討する。
この場合でも、`Open Folder`は`nvim-tree.lua`を使うか、Telescopeでディレクトリ選択を扱うかを別途判断する。

## Consequences

### Positive

- 空バッファではなく、目的の操作に進みやすい起動画面を表示できる。
- ファイル選択とディレクトリ選択に既存の`nvim-tree.lua`を利用できる。
- `alpha-nvim`は起動画面に特化しており、設定を小さく保ちやすい。
- Telescopeなどの追加プラグインなしで最小構成にできる。

### Negative

- 起動画面のために新しいプラグイン依存が増える。
- 高度なファイル検索や最近使ったファイル一覧は、Telescopeなどの追加設定または別プラグインが必要になる。
- 見た目を作り込みすぎると、設定が大きくなる。

## Alternatives Considered

- `nvimdev/dashboard-nvim`
  - 見た目の整ったdashboardを作りやすい。
  - 今回の要件には機能が多め。
- `nvim-mini/mini.starter`
  - 小さく保ちやすい。
  - 見た目の自由度は`alpha-nvim`より控えめ。
- プラグインなしの自作起動画面
  - 依存を増やさずに済む。
  - UIと操作の保守を自分で持つ必要がある。

## Review Trigger

- 起動画面の設定が複雑になりすぎる。
- Neovim本体または既存プラグインだけで十分になる。
- `alpha-nvim`が未メンテナンスになる。
- Telescopeなどの導入により、起動画面で使うアクションを見直したくなる。
