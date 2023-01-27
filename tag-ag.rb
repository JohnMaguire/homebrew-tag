HOMEBREW_TAG_VERSION="v1.4.1".freeze
class TagAg < Formula
  desc "Instantly jump to your ag or ripgrep matches."
  homepage "https://github.com/JohnMaguire/tag"
  url "https://github.com/JohnMaguire/tag/archive/refs/tags/#{HOMEBREW_TAG_VERSION}-JohnMaguire.tar.gz"
  sha256 "d6771f8304e4ef28bbc531c50afa145147125ed94c4362e1c9665598749a0283"

  version HOMEBREW_TAG_VERSION
  head "https://github.com/JohnMaguire/tag.git", :branch => "master"

  depends_on "go" => :build

  def install
    go_build
    bin.install "tag"
  end

  def go_build
    mkdir_p buildpath/"src/github.com/JohnMaguire"
    ln_s buildpath, buildpath/"src/github.com/JohnMaguire/tag"
    system "go", "build", "-o", "tag"
  end

  test do
  end
end
