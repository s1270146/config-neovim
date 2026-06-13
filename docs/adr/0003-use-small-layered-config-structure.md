# Use Small Layered Config Structure

## Status
Accepted

## Context

まだNeovim設定本体は存在しない。

これからlazy.nvimを導入し、個人用のNeovim設定を育てる。
設定は小さく、理解しやすく、保守しやすくしたい。

最初から大きな構成にすると、ファイル数や抽象化が増えすぎる。
一方で、すべてを`init.lua`に書くと、プラグイン追加後に見通しが悪くなる。

## Decision

初期構成は、薄い入口と少数の責務別ファイルに分ける。

```txt
.
├── init.lua
├── lazy-lock.json
├── lua/
│   ├── config/
│   │   ├── lazy.lua
│   │   ├── options.lua
│   │   └── keymaps.lua
│   └── plugins/
│       └── example-plugin.lua
└── docs/
    └── adr/
```

各ファイルの責務は次の通り。

- `init.lua`
  - 設定の入口。
  - `config.options`、`config.keymaps`、`config.lazy` を読み込むだけにする。
- `lua/config/options.lua`
  - Neovim組み込みオプションを置く。
  - プラグイン設定は置かない。
- `lua/config/keymaps.lua`
  - プラグインに依存しない基本キーマップを置く。
  - プラグイン固有のキーマップは各プラグイン定義に寄せる。
- `lua/config/lazy.lua`
  - lazy.nvimのbootstrapとsetupだけを置く。
  - 個別プラグイン設定は置かない。
- `lua/plugins/*.lua`
  - プラグインごとの設定を1ファイルずつ置く。
  - ファイル名はプラグイン名または機能名に合わせる。
  - 1ファイルはlazy.nvimのplugin spec、またはplugin specの配列を返す。
- `lazy-lock.json`
  - lazy.nvimが生成するlockfile。
  - Git管理する。

導入順序は次の通り。

1. `init.lua`、`lua/config/options.lua`、`lua/config/keymaps.lua`を作る。
2. `lua/config/lazy.lua`でlazy.nvimをbootstrapする。
3. `lua/config/lazy.lua`で`{ import = "plugins" }`を読み込む。
4. 最初のプラグインを追加するときに`lua/plugins/*.lua`を作る。
5. Neovimを起動し、lazy.nvimをインストールする。
6. `lazy-lock.json`が生成されたらGit管理する。
7. 最初のプラグイン追加は別ADRで判断する。

## Consequences

### Positive

- `init.lua`が小さく保たれる。
- Neovim組み込み設定とプラグイン設定の境界が明確になる。
- 最初の構成が大きくなりすぎない。
- プラグインが増えた場合も自然に分割できる。

### Negative

- 設定が少ない初期段階では、ファイル分割がやや多く見える。
- `config`と`plugins`の責務を守らないと、構成の意味が薄れる。

## Alternatives Considered

- すべてを`init.lua`に書く
  - 最小だが、プラグイン導入後に肥大化しやすい。
- LazyVim風に細かく分割する
  - 慣れているが、この設定には最初から大きすぎる。
- `lua/core/`と`lua/plugins/`に分ける
  - 一般的だが、`core`という名前は責務が曖昧になりやすい。
- `lua/plugins/init.lua`にまとめる
  - ファイル数は少なくなる。
  - プラグイン追加後に差分が集中しやすく、個別の判断を追いにくい。

## Review Trigger

- `init.lua`に実処理が増え始める。
- `lua/plugins/*.lua`の粒度が細かすぎる、または大きすぎる。
- プラグイン数が増え、分割方針が必要になる。
- Neovim組み込み設定とプラグイン設定の境界が曖昧になる。
