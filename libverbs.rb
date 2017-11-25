class Libverbs < Formula
  desc "RDMA core userspace libraries and daemons "
  homepage "https://github.com/numactl/numactl.git"
  url 'https://github.com/linux-rdma/rdma-core.git'
  head "https://github.com/linux-rdma/rdma-core.git"
  version '15'

  depends_on "libnl" => :build

  def install
    system "./build.sh"
    Dir.chdir("build")
    system "make", "install/local"
    system "cp ./* #{prefix}"
  end
end
