class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/cf/09/583c10895d6f38e49b5391fd49c199041f559669ce06923beac75daba232/chainq-0.11.0.tar.gz"
  sha256 "e759f4a765053b6c21b548c344bfda5aab2411497ee8bd135269d63015a23690"
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
