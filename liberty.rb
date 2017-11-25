class Liberty < Formula
  desc "RDMA core userspace libraries and daemons "
  homepage "https://github.com/redox-os/binutils-gdb"
  url 'https://github.com/redox-os/binutils-gdb'
  head "https://github.com/redox-os/binutils-gdb"
  version '15'

  def install
    mkdir "build"
    Dir.chdir("build")
    system "../configure --prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
