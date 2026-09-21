class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/81/dd/98dd4aaaff098815047393615a8b8c24017caf21016ed0ece1b52017084b/chainq-0.22.0.tar.gz"
  sha256 "9fadd59f5af166cb077effd685a2d5389f4e6115f1f910c0ab2fe771316e52c9"
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
