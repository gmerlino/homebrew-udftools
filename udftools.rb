class Udftools < Formula
  desc "Linux tools for UDF filesystems and DVD/CD-R(W) drives"
  homepage "https://github.com/pali/udftools"

  head "https://github.com/gmerlino/udftools.git", :branch => "brew"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  conflicts_with "udffsck", :because => "both install `udffsck` binary"

  def install
    if build.head?
      inreplace "autogen.sh", "libtoolize", "glibtoolize"
      system "sh", "autogen.sh"
    end
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "#{bin}/mkudffs", "--help"
  end
end
