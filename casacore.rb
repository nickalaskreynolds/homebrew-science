# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Casacore < Formula
  desc "The Core libraries of the CASA Radio Astronomy Software package."
  homepage "http://casacore.github.io/casacore/"
  head "https://github.com/casacore/casacore.git"

  depends_on "cmake" => :build
  depends_on "gcc"
  depends_on "flex"
  depends_on "bison"
  depends_on "cfitsio"
  depends_on "wcslib"
  depends_on "fftw" => :optional
  depends_on "hdf5" => :optional
  depends_on "python2"
  depends_on "python3" => :optional
  depends_on "boost-python"
  depends_on "ncurses" => :optional

  option "with-openmp"
  option "with-threads"
  option "without-python2"

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    
    # Download the measures data.
    system "mkdir", "data"
    chdir "data"
    system HOMEBREW_PREFIX/"bin/wget", "-r", 
                   "--cut-dirs", "100", 
                   "--no-parent", "-nH", "-A", 
                   "*.ztar", 
                   "ftp://ftp.astron.nl/outgoing/Measures/*.ztar"
    system "tar", "xf", "WSRT_Measures.ztar"
    chdir ".."

    prefix.install Dir["data"]

    system "mkdir", "build"
    chdir "build"

    args = %W[
        -DDATA_DIR=#{prefix}/data
    ]

    args << "-DUSE_FFTW3=ON" if build.with?("fftw")
    args << "-DUSE_HDF5=ON" if build.with?("hdf5")
    args << "-DUSE_OPENMP=ON" if build.with?("openmp")
    args << "-DUSE_THREADS=ON" if build.with?("threads")
    args << "-DBUILD_PYTHON3=ON" if build.with?("python3")

    if build.with? "boost-python"
        args << "-DBoost_NO_BOOST_CMAKE=False"
    else
        args << "-DBoost_NO_BOOST_CMAKE=True"
    end

    system "cmake", "..", *std_cmake_args, *args
    system "make"
    system "make", "install"
  end

end
