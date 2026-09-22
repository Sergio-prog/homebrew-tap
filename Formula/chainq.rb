class Chainq < Formula
  include Language::Python::Virtualenv

  desc "Agent-friendly CLI for onchain and crypto market data"
  homepage "https://github.com/Sergio-prog/chainq"
  url "https://files.pythonhosted.org/packages/e1/64/87fd02f8bd4d19f8e62ca37c397656faf891a68a563b4dd8630e024090e2/chainq-0.22.1.tar.gz"
  sha256 "d834e336f062a3e3a20a7a1c706b114d16f3417bfd874b6cfdddaf16a7ab7106"
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
