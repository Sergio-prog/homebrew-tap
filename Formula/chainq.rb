class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/00/e3/25e39b245a8c8ad1689e7e642c8d36458401b60bfa0b10dc09d3b5ab6b48/chainq-0.15.1.tar.gz"
  sha256 "ca75f9193c184a76f8a859a042cacd1ca354f14302e5fa378f999e1b83bf75ac"
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
