class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/7b/2f/70e0b802ced3ae5294c8acbf6bd548c9985be35d3e1c2ba948b6a1631ffb/chainq-0.17.0.tar.gz"
  sha256 "aa2b3dfe439d25c9baecf5b99c1ab11ed2ea3caa11c9c0f73803824f99364763"
  license "MIT"

  depends_on "python@3.12"

  def install
    virtualenv_create(libexec, "python3.12")
    system libexec/"bin/python", "-m", "pip", "install", "--quiet", buildpath
    bin.install_symlink libexec/"bin/chainq"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chainq version")
  end
end
