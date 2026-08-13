# Sergio-prog Homebrew Tap

```bash
brew install sergio-prog/tap/chainq

brew tap sergio-prog/tap
brew trust --cask sergio-prog/tap/nowsee
brew install --cask --no-quarantine nowsee
```

The trust command approves only the Nowsee cask. Use `brew trust sergio-prog/tap` only if you want
to trust every current and future package in this tap.

Formulae here are updated automatically by release workflows in their source repos.

| Formula | Description | Source |
|---|---|---|
| `chainq` | Agent-friendly CLI for onchain and crypto market data | [Sergio-prog/chainq](https://github.com/Sergio-prog/chainq) |

| Cask | Description | Source |
|---|---|---|
| `nowsee` | Live visualizer for macOS system audio, in the menu bar and in a window | [Sergio-prog/Nowsee](https://github.com/Sergio-prog/Nowsee) |

Nowsee is signed but not notarized, so Homebrew's quarantine attribute would make Gatekeeper
refuse the first launch. Install it with `--no-quarantine`, or open it once from Finder with
right-click → Open.
