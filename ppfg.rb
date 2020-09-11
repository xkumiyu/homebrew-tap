class Ppfg < Formula
  desc "Automatically generates python package formula file"
  homepage "https://github.com/xkumiyu/python-package-formula-generater"
  url "https://github.com/xkumiyu/python-package-formula-generater/archive/0.1.0.tar.gz"
  sha256 "f1277b79e7038ce2ae08e018e9c0dd165c0b84ddec08c98e24588b00aacf6906"

  def install
    bin.install "bin/ppfg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ppfg -V")
  end
end
