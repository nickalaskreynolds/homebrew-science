class FFTW < Formula

  def install
     ENV.deparallelize  # if your formula fails when building in parallel

    args = %W[
      --prefix=#{prefix}
      --enable-shared 
      --enable-openmp
    ]

    system "mkdir", "d_p"
    Dir.chdir("d_p")
    system "../configure",*args
    system "make"
    system "make", "install"
    Dir.chdir("..")

    args = %W[
      --prefix=#{prefix}
      --enable-shared 
      --enable-single 
      --enable-openmp
    ]

    system "mkdir", "s_p"
    Dir.chdir("s_p")
    system "../configure",*args
    system "make"
    system "make", "install"
    Dir.chdir("..")

    args = %W[
      --prefix=#{prefix}
      --enable-shared 
      --enable-openmp
    ]

    system "mkdir", "d_p_omp"
    Dir.chdir("d_p_omp")
    system "../configure",*args 
    system "make"
    system "make", "install"
    Dir.chdir("..")

    args = %W[
      --prefix=#{prefix}
      --enable-shared 
      --enable-single 
      --enable-openmp
    ]

    system "mkdir", "s_p_omp"
    Dir.chdir("s_p_omp")
    system "../configure",*args 

    Dir.chdir("..")

  end
end
