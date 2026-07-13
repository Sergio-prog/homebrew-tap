class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/ca/b4/72c37f12dfc5690e5bee78689d49d62bf131762769218f23b6328b3ae1a1/chainq-0.16.0.tar.gz"
  sha256 "2ac3e9578248c43c8127ea02d322c7950a44c947f2cf7f91c31857d52daa9464"
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
