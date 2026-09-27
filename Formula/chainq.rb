class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/9a/30/7eef7a6d24c035c00e186a054fdc92a677bbc741cd8d1034df7e0e8ecabb/chainq-0.23.0.tar.gz"
  sha256 "c9c71b1134169a41ead06f309e079acff9352020bacab615cee7b45bef99a320"
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
