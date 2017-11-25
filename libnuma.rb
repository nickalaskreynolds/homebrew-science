class libnuma < Formula
  desc "NUMA(Not uniform memory access) support for linux"
  homepage "https://github.com/numactl/numactl.git"
  head "https://github.com/numactl/numactl.git"

  depends_on "cmake" => :build
  depends_on "fftw" => "with-openmp"
  depends_on "python3"

  def install
     ENV.deparallelize  # if your formula fails when building in parallel

    system "mkdir", "build"
    system "./autogen.sh"
    Dir.chdir("build")
    system "../configure", "--disable-debug",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
