require 'formula'

class libnl < Formula
  desc "Netlink Library Suite"
  homepage "https://github.com/thom311/libnl"
  head "https://github.com/thom311/libnl.git"

  depends_on "cmake" => :build
  depends_on "fftw" => "with-openmp"
  depends_on "python3"

  def install
     ENV.deparallelize  # if your formula fails when building in parallel

    system "mkdir", "build"
    system "./autogen.sh"
    Dir.chdir("build")
    system "../configure", "--disable-debug",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
