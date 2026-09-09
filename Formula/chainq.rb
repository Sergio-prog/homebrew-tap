class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/ac/70/719f195d78a8af88602f3b9e4552927d18f0c24a278bd8a5d4ec7698af22/chainq-0.20.0.tar.gz"
  sha256 "dfa7648145a8816dc8c058d129efc636f080789d4b1fa93706270079ba0a8a0b"
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
