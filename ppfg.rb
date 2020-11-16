class Ppfg < Formula
  desc "Automatically generates python package formula file"
  homepage "https://github.com/xkumiyu/python-package-formula-generater"
  url "https://github.com/xkumiyu/python-package-formula-generater/archive/0.2.0.tar.gz"
  sha256 "07247b10a4eb9b864ddec5cc581be2de3dc76b859ff6be8e33e8e2f7dd75086c"

  def install
    bin.install "bin/ppfg"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ppfg -V")
  end
end
