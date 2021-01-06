class Disktree < Formula
  desc "DiskTree - a CLI that displays the file size according to directory structure."
  homepage "https://github.com/xkumiyu/disktree"
  url "https://github.com/xkumiyu/disktree/archive/0.2.0.tar.gz"
  sha256 "36baac46b7828d242d7302241eaa060c42be69356e41edf71d8c03a33cf4b152"

  depends_on 'go' => :build

  def install
    system "make", "build"
    bin.install "dtree"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dtree -version")
  end
end
