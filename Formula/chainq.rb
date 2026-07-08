class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/50/65/332fb1d2b1d6f7d9d7b0408e1e9e1cc2ee93f4a7b0cb995c1056c0257bf7/chainq-0.15.0.tar.gz"
  sha256 "acc41621a5cfd8ccd30dd3c8bafa28a643c7d2257622e0c43f65725329ae6810"
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
