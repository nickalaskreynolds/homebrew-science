require 'formula'


class Latex < Formula
  desc 'Installs the latest latex distr from tug'
  homepage 'https://tug.org/texlive/svn/'
  url 'https://tug.org/texlive/svn/'
  version Time.now.strftime("%Y.%m.%d")

  depends_on "freetype"

  def install
    system "rsync","-a","--delete","--exclude=.svn","tug.org::tldevsrc/Build/source","."    
    Dir.chdir("source")
    Dir.mkdir("building-temp")
    Dir.chdir("building-temp")
    system "../configure","--prefix#{prefix}","-C"
    system "make"
    system "make","install"
  end
end
