# Neovim Configuration

Personal Neovim configuration.

The goal of this configuration is not to become a feature-rich distribution.

The goal is to remain:

* Small
* Understandable
* Maintainable

This repository is managed using:

* Git
* ADR (Architecture Decision Records)
* Codex

## Philosophy

This configuration is treated like a bonsai.

Every addition should justify its existence.

Complexity should be removed whenever possible.

## Documentation

* ADR Guide: `docs/adr-guide.md`
* ADRs: `docs/adr/`

## Principles

* Prefer built-in Neovim features.
* Avoid unnecessary plugins.
* Keep changes small and reviewable.
* Document important decisions with ADRs.

## Repository Structure

```txt
.
├── AGENTS.md
├── README.md
├── docs/
│   ├── adr-guide.md
│   └── adr/
├── lua/
└── init.lua
```

