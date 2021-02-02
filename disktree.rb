class Disktree < Formula
  desc "DiskTree - a CLI that displays the file size according to directory structure."
  homepage "https://github.com/xkumiyu/disktree"
  url "https://github.com/xkumiyu/disktree/archive/0.3.0.tar.gz"
  sha256 "f72b864c03cf203b0ca42c88449f666a937ae95e62dae56a35c60f06dd15220c"

  depends_on 'go' => :build

  def install
    system "make", "build"
    bin.install "dtree"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dtree -version")
  end
end
