require 'formula'


class Freetype < Formula
  desc 'Installs Freetype from source/ Stable version'
  homepage 'https://download.savannah.gnu.org/releases/freetype'
  url 'https://download.savannah.gnu.org/releases/freetype/freetype-2.9.tar.gz'

  def install
    Dir.mkdir("building-temp")
    Dir.chdir("building-temp")
    system "../configure","--prefix#{prefix}"
    system "make"
    system "make","install"
  end
end
