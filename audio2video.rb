require File.expand_path("../../../Homebrew/homebrew-php/language/php", __FILE__)
require File.expand_path("../../../Homebrew/homebrew-php/Requirements/php-meta-requirement", __FILE__)

class Audio2video < Formula
  include Language::PHP::Composer

  desc "A CLI tool to convert an audio file to a simple video file."
  homepage "https://github.com/ttskch/audio2video-cli"
  url "https://github.com/ttskch/audio2video-cli/archive/0.0.1.tar.gz"
  sha256 "a5f9e8b4255ef2e5ab085af0e92964acc4365c75a6485566608a5d42956efdc8"

  depends_on PhpMetaRequirement
  depends_on "ffmpeg" => "with-tools"
  depends_on "imagemagick"
  depends_on "php53-imagick" if Formula["php53"].linked_keg.exist?
  depends_on "php54-imagick" if Formula["php54"].linked_keg.exist?
  depends_on "php55-imagick" if Formula["php55"].linked_keg.exist?
  depends_on "php56-imagick" if Formula["php56"].linked_keg.exist?
  depends_on "php70-imagick" if Formula["php70"].linked_keg.exist?
  depends_on "php71-imagick" if Formula["php71"].linked_keg.exist?

  def install
    composer_install
    bin.install ["audio2video", "vendor"]
  end

  test do
    system "#{bin}/audio2video"
    system "#{bin}/audio2video", "conv", "-h"
  end
end
