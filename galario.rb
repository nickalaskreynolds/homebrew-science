class Galario < Formula
  desc "GPU Accelerated Library for Analysing Radio Interferometer Observations"
  homepage "https://mtazzari.github.io/galario/#gpu-accelerated-library-for-analysing-radio-interferometer-observations"
  head "https://github.com/mtazzari/galario.git"

  depends_on "cmake" => :build
  depends_on "fftw" => "with-openmp"
  depends_on "python3"

  def install
     ENV.deparallelize  # if your formula fails when building in parallel

    system "mkdir", "build"
    Dir.chdir("build")
    system "cmake", *std_cmake_args,
                    "-DGALARIO_CHECK_CUDA=0",
                    "-DPython_ADDITIONAL_VERSIONS=3.6", ".."
    system "make"
    system "make", "install"
  end
end
