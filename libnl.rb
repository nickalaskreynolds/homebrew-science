class Libnl < Formula
  desc "Netlink Library Suite"
  homepage "https://github.com/thom311/libnl"
  url "https://github.com/thom311/libnl.git"
  head "https://github.com/thom311/libnl.git"

  def install
    mkdir "build"
    system "./autogen.sh"
    Dir.chdir("build")
    system "../configure", "--disable-debug",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
