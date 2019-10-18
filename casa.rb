require 'formula'

class Casa < Formula
  homepage 'http://casa.nrao.edu/'
  url 'https://casa.nrao.edu/download/distro/linux/release/el7/casa-release-5.1.2-4.el7.tar.gz', :using => :curl
  sha256 '12fab0c13b217449d21fa9d1494ee8be8a9181ad8c729420e222690835a642dc'
  version '5.1.2'
  keg_only 'Because it comes with a lot of preinstalled libraries I dont want to link'

  option "with-system-xml", "Use the system version of xml rather than the one packaged with CASA."

  def install
    prefix.install Dir['*']

    if build.with? "system-xml"
        system "rm", "#{prefix}/lib64/libxml2.so.2"
        system "ln", "-sf", "/usr/lib64/libxml2.so.2.7.7", "#{prefix}/lib64/libxml2.so.2"
    end
  end
end
