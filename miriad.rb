require 'formula'

class Miriad < Formula
  homepage ''
  url 'ftp://ftp.atnf.csiro.au/pub/software/miriad/miriad-linux64.tar.bz2'
  version '4.3.7.20131227'
  keg_only "This is just the way that MIRIAD works."

  depends_on 'gcc'

  def install
    ENV.deparallelize

    mkdir "build"
    Dir.chdir("build")
    system "../configure", "--prefix=#{prefix}", "--with-telescope=carma"
    system "make"
    system "make", "install"
  end
end
