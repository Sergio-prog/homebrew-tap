class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/3d/ac/2c2c368e909c4879b7b2ece790d4c5e61c52040a54041351f8d0dfb14cf5/chainq-0.12.1.tar.gz"
  sha256 "c502caee4bfd9a1297043dc9312314b4a067fc9a7f7736297f6646d10aa1903d"
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
