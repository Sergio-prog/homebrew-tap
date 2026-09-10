class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/5b/ee/5bd560bcccde83571f83607c193edcab8124b96f0d1f8ccbb93d7e8611e4/chainq-0.20.2.tar.gz"
  sha256 "4467fa388f74e106ff3c382639d167c96655386d762c3f3003c0a732123c7b1b"
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
