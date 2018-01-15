class Fftw < Formula
  desc "A C subroutine library for computing the discrete FT"
  homepage "http://fftw.org/"
  url "http://fftw.org/fftw-3.3.7.tar.gz"
  version "3.3.7"
  sha256 "3b609b7feba5230e8f6dd8d245ddbefac324c5a6ae4186947670d9ac2cd25573"

  def install
    ENV.deparallelize

    args = %W[
      --prefix=#{prefix}
      --enable-shared
    ]

    Dir.mkdir("d_p")
    Dir.chdir("d_p")
    system "../configure", *args
    system "make"
    system "make", "install"
    Dir.chdir("..")

    args = %W[
      --prefix=#{prefix}
      --enable-shared
      --enable-single
    ]

    Dir.mkdir("s_p")
    Dir.chdir("s_p")
    system "../configure", *args
    system "make"
    system "make", "install"
    Dir.chdir("..")

    args = %W[
      --prefix=#{prefix}
      --enable-shared
      --enable-openmp
      --enable-threads
    ]

    Dir.mkdir("d_p_omp")
    Dir.chdir("d_p_omp")
    system "../configure", *args
    system "make"
    system "make", "install"
    Dir.chdir("..")

    args = %W[
      --prefix=#{prefix}
      --enable-shared
      --enable-single
      --enable-openmp
      --enable-threads
    ]

    Dir.mkdir("s_p_omp")
    Dir.chdir("s_p_omp")
    system "../configure", *args
    system "make"
    system "make", "install"
  end
end
