class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/c1/e3/f471804ae8caaf3d228bc377c230d2a2e0489965da9f00b78e8e274af423/chainq-0.13.1.tar.gz"
  sha256 "fee866dd371bcb4f23e0cdbba672943aec2075ac85676d26b6c425e9581f8094"
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
