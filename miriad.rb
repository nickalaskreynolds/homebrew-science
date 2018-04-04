require 'formula'

class Miriad < Formula
  homepage 'https://github.com/nickalaskreynolds/miriad_linux.git'
  url 'https://github.com/nickalaskreynolds/miriad_linux.git'
  version '4.3.7.20131227'
  keg_only "This is just the way that MIRIAD works."

  depends_on 'gcc'

  def install
    ENV.deparallelize

    mkdir "build"
    Dir.chdir("build")
    system "../configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
