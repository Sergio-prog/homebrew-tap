class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/b0/05/915f7f781cfac5e6a5355fefb13ee6d11b4e65946f2a075ab42ac49d58d9/chainq-0.12.0.tar.gz"
  sha256 "ae2e12fa5b872fd91ef563c6b3cad5dbe28e124dec8680ad52b247ff2e5755cf"
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
