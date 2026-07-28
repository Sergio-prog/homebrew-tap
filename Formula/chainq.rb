class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/ad/26/4cb766e44fc29dc30f97a29dae8dc28ce3619753c54d659bd8cd8f75f5ae/chainq-0.18.0.tar.gz"
  sha256 "9f15a0f31df51560e65d956792f8cd6c31a1ee1e5f01955cb79620d9ba8f28a3"
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
