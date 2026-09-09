class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/e1/de/78c05426c5882d985d68e08c8d40e2992cc931882a724c1f6680702b2907/chainq-0.20.1.tar.gz"
  sha256 "7bcf561c93e9fd0ce15581062b1782d6cfdf07ec9b6a727c1716f2f3040f1ae3"
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
