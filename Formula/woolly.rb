class Woolly < Formula
  desc "Local project memory for coding agents that flags stale facts"
  homepage "https://usewoolly.com"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rjcuff/woolly/releases/download/v0.17.0/woolly_darwin_arm64.tar.gz"
      sha256 "cf43ad74a4532de41466a8ec1fe97b8186f86bb2431458362ece936afa170cae"
    end
    on_intel do
      url "https://github.com/rjcuff/woolly/releases/download/v0.17.0/woolly_darwin_amd64.tar.gz"
      sha256 "365398cfb7754cd8b772a7f610766866ead7582897a0162e451768e2f1e6e11d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rjcuff/woolly/releases/download/v0.17.0/woolly_linux_arm64.tar.gz"
      sha256 "710cb6e799fdefefd25e66c8389b666cfd0f1d6315ad88d4da8b8f03d3eef07b"
    end
    on_intel do
      url "https://github.com/rjcuff/woolly/releases/download/v0.17.0/woolly_linux_amd64.tar.gz"
      sha256 "446a468429e1d3a886bc0a60117dccdb54de656b23b7b1ef681c0e5424bc927a"
    end
  end

  def install
    bin.install "woolly"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/woolly version")
    ENV["WOOLLY_HOME"] = testpath/"woolly"
    ENV["WOOLLY_NO_EMBED"] = "1"
    system bin/"woolly", "remember", "Homebrew test"
    assert_match "Homebrew test", shell_output("#{bin}/woolly list")
  end
end
