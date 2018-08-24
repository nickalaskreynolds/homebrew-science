require 'formula'

class Mpich < Formula
  homepage 'http://www.mpich.org/downloads/'
  url 'http://www.mpich.org/static/downloads/3.2.1/mpich-3.2.1.tar.gz'

  def install
    ENV.deparallelize
    system "./configure", "--disable-debug",
                          "--disable-fortran",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
