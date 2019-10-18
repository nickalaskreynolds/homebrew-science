require 'formula'

class Hyperion < Formula
  homepage 'www.hyperion-rt.org'
  url 'https://pypi.python.org/packages/4f/6a/9693382f131369526c10d396a2371db1782856bed03ebe8500c89939114e/Hyperion-0.9.9.tar.gz'
  sha256 'e763a99370b1f961fa2c99b8f5c69cdd618787079af6c6cd63de6a953137e501'

  depends_on 'hdf5@1.8'
  depends_on 'mpich'

  def install
    ENV.deparallelize

    system "./configure", "--disable-debug",
                          "--prefix=#{prefix}"

    inreplace 'Makefile', ' -g', ''

    system "make"
    system "make", "install"
  end
end
