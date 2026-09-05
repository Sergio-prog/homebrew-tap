# Sergio-prog Homebrew Tap

```bash
brew install sergio-prog/tap/chainq
brew install sergio-prog/tap/fram

brew tap sergio-prog/tap
brew trust --cask sergio-prog/tap/nowsee
brew install --cask nowsee
```

The trust command approves only the Nowsee cask. Use `brew trust sergio-prog/tap` only if you want
to trust every current and future package in this tap.

Formulae here are updated automatically by release workflows in their source repos.

| Formula | Description | Source |
|---|---|---|
| `chainq` | Agent-friendly CLI for onchain and crypto market data | [Sergio-prog/chainq](https://github.com/Sergio-prog/chainq) |
| `fram` | Compact media workshop for terminal and agent automation | [Sergio-prog/fram](https://github.com/Sergio-prog/fram) |

| Cask | Description | Source |
|---|---|---|
| `nowsee` | Live visualizer for macOS system audio, in the menu bar and in a window | [Sergio-prog/Nowsee](https://github.com/Sergio-prog/Nowsee) |

Nowsee is self-signed and not yet notarized by Apple. After macOS blocks the first launch, open
**System Settings → Privacy & Security**, scroll to **Security**, click **Open Anyway** next to
Nowsee, authenticate, then confirm **Open**.

If you trust this tap and prefer the terminal:

```sh
xattr -dr com.apple.quarantine /Applications/Nowsee.app
open -a Nowsee
```
