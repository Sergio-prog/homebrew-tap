class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/82/22/ead870d0bdb949492ecdfc5ac4ecc9ee6bd613eac851e2fbf84c4268a575/chainq-0.14.0.tar.gz"
  sha256 "0e8d9926e32c4d97ec713fa821ecd416f77b85a578fe6dffc72f71bc012e93c8"
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
