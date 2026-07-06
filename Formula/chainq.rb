class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/94/56/98e834f3a7ba103c160c270adad0e4c30b053722dc955ed103c39a8ecc9c/chainq-0.13.0.tar.gz"
  sha256 "4246d10bcf912f7cf563df9a7e30211b8cf1dffa9ac588dc2ae715a17c253548"
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
