class Sublime < Formula
  homepage 'https://github.com/nickalaskreynolds/sublime3.git'
  url 'https://github.com/nickalaskreynolds/sublime3.git'
  version '3'

  def install
    ENV.deparallelize
    mkdir "build"
    Dir.chdir("build")

    system "cp -r src/ ","#{prefix}"
    system "cp -r bin/ ","#{prefix}"
  end
end
