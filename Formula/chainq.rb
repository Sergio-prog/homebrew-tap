class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/de/c2/a2ee23d9944c6166dd29d8ca968248d483309053906d18bc79668533bb69/chainq-0.19.0.tar.gz"
  sha256 "b47dafd12749c856e5f7cceeed878856746e761efe760e64f0d9756ae61bbc40"
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
