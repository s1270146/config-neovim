# ADR Guide

## Purpose

ADR records arhitectural and long-term decisions.

The goal is not to ducument every change.

the goal is to preserve the reasoning behind important decisions.

## When to create an ADR

Create an ADR when:

- Adding a plugin
- Removing a plugin
- Replacing a plugin
- Changing plugin manager
- Changing completion strategy
- Changing LSP strategy
- Changing formatting strategy
- Changing testing strategy
- Changing project structure

## When NOT to create an ADR

Do not create ADRs for:

- Bug fixes
- Small keymap additions
- Option changes
- Refactoring
- Comment updates
- Documentation updates

## ADR Status

### Proposed

Being discussed.

### Accepted

Current decision.

### Rejected

Considered but not adopted.

### Superseded

Replaced by another ADR.

## Naming

ADRs use the format:

0001-short-title.md

Example:

0001-config-philosophy.md
0002-use-lazy-nvim.md
0003-use-blink-cmp.md

## Review Trigger

An ADR should be reviewd when:

- The decision becomes difficult to maintain
- Neovim introduces native support
- The plugin becomes unmaintained
- Asimpler solution appers
