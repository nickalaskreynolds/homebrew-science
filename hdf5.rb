require 'formula'

class Hdf5 < Formula
  homepage 'https://support.hdfgroup.org/HDF5/release/obtain518.html'
  url 'https://support.hdfgroup.org/ftp/HDF5/current18/src/hdf5-1.8.20.tar'
  sha256 '62fbf5c68210f0e984dd648e656c3f9b'

  def install
    ENV.deparallelize
    system "./configure", "--disable-debug",
                          "--enable-parallel",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
