class Disktree < Formula
  desc "DiskTree - a CLI that displays the file size according to directory structure."
  homepage "https://github.com/xkumiyu/disktree"
  url "https://github.com/xkumiyu/disktree/archive/0.1.0.tar.gz"
  sha256 "8a215418895012dca791c1aaca24b3c8bc1a5f3e49f2924fe35149859738e43a"

  depends_on 'go' => :build

  def install
    system "make", "build"
    bin.install "dtree"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dtree -version")
  end
end
