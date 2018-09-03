require 'formula'


class Latex < Formula
  desc 'Installs the latest latex distr from tug'
  homepage 'https://tug.org/texlive/svn/'
  url 'https://tug.org/texlive/svn/'
  version Time.now.strftime("%Y.%m.%d")

  def install
    system "rsync","-a","--delete","--exclude=.svn","tug.org::tldevsrc/Build/source","."    
    Dir.chdir("source")
    system "TL_INSTALL_DEST=#{prefix}" 
    system "./Build"
  end
end
