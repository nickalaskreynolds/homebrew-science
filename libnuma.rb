class Libnuma < Formula
  desc "NUMA(Not uniform memory access) support for linux"
  homepage "https://github.com/numactl/numactl.git"
  url 'https://github.com/numactl/numactl.git'
  head "https://github.com/numactl/numactl.git"

  def install
    mkdir "build"
    system "./autogen.sh"
    Dir.chdir("build")
    system "../configure", "--disable-debug",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
