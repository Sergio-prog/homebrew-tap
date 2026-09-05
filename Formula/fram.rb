class Fram < Formula
  include Language::Python::Virtualenv

  desc "Compact media workshop for terminal and agent automation"
  homepage "https://fram.serhiifotex.dev/"
  url "https://github.com/Sergio-prog/fram/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "830dea25ae7060dc9de263d35bc1151b349f4e405f94f1152db20e649cb5f6a1"
  license "MIT"
  head "https://github.com/Sergio-prog/fram.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "ffmpeg"
  depends_on "python@3.12"

  def install
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/python", "-m", "pip", "install", "--quiet", buildpath
    bin.install_symlink libexec/"bin/fram"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fram version")
  end
end
