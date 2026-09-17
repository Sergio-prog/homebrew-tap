class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/21/e9/6cd79e9f3f338cf92a19666ea3927c9b59cf39616009ab98add26315eedf/chainq-0.21.0.tar.gz"
  sha256 "52d27aea68f3c9d717d6799a842d970acf403693e14c03260ce70f6a96cd2c35"
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
