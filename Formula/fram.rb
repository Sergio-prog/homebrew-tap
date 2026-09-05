class Fram < Formula
  include Language::Python::Virtualenv

  desc "Compact media workshop for terminal and agent automation"
  homepage "https://fram.serhiifotex.dev/"
  url "https://github.com/Sergio-prog/fram/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "c859d8d97019d96aaf2e054969c06f9732dc9a1737875cf1b75c4cc119e8e224"
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
