class Ghosttype < Formula
  desc "TUI font & theme picker for Ghostty with live previews and instant reload"
  homepage "https://github.com/Sergio-prog/ghosttype"
  url "https://github.com/Sergio-prog/ghosttype/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "92581d0f91fe9cbd3a51784423748ecbccb57e987544434e0e18e6188a3fb5d4"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "bun"
  depends_on :macos

  def install
    system "bun", "install", "--frozen-lockfile", "--production"
    libexec.install "src", "node_modules", "package.json"
    (bin/"ghosttype").write <<~SH
      #!/bin/bash
      exec "#{Formula["bun"].opt_bin}/bun" "#{libexec}/src/index.ts" "$@"
    SH
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ghosttype --version")
  end
end
