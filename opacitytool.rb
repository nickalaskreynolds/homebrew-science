# Documentation: https://docs.brew.sh/Formula-Cookbook.html
#                http://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Opacitytool < Formula
  desc ""
  homepage ""
  url "http://dianaproject.wp.st-andrews.ac.uk/files/2015/05/OpacityTool_4_2015.zip"
  sha256 "6c0bdd5a5a50086ba3f19cc7ecda070ad4d9e916b89a42f6d9cd417339943eed"
  version "2015.04"

  depends_on "gcc" => :build

  def install
    inreplace 'Makefile', '-fdefault-double-8', '-fdefault-double-8 -fdefault-real-8'

    system "make"

    bin.install("OpacityTool")
  end

end
