class Woolly < Formula
  desc "Local memory for your AI tools"
  homepage "https://usewoolly.com"
  version "0.14.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rjcuff/woolly/releases/download/v0.14.1/woolly_darwin_arm64.tar.gz"
      sha256 "e63c38a68b00c9fb1b11a1d762a0eb96f74ac8a8869b2208eb3ba3d0300b26d1"
    end
    on_intel do
      url "https://github.com/rjcuff/woolly/releases/download/v0.14.1/woolly_darwin_amd64.tar.gz"
      sha256 "7e3bde33864b2b3b56164965198e1691b4d62df68886680e38496fd2a362a83f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rjcuff/woolly/releases/download/v0.14.1/woolly_linux_arm64.tar.gz"
      sha256 "cc418a879447cb01e9a4e396b9bb623ec6f0709c90cc5ec671f20273f539eb13"
    end
    on_intel do
      url "https://github.com/rjcuff/woolly/releases/download/v0.14.1/woolly_linux_amd64.tar.gz"
      sha256 "416ece06b55d931a334c85734baa1f2fdfe570864994b43f69ea4ef3e75a8b04"
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
