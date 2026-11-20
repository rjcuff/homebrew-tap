class Woolly < Formula
  desc "Local project memory for coding agents that flags stale facts"
  homepage "https://usewoolly.com"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rjcuff/woolly/releases/download/v0.18.0/woolly_darwin_arm64.tar.gz"
      sha256 "3fdbc4a1ac66c1cdb17af8a349642edd5b851212821e448f03d72c282215262f"
    end
    on_intel do
      url "https://github.com/rjcuff/woolly/releases/download/v0.18.0/woolly_darwin_amd64.tar.gz"
      sha256 "222186378982df68b761707e7496fbed72c0bd516808a4d1e690359973f77bf4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rjcuff/woolly/releases/download/v0.18.0/woolly_linux_arm64.tar.gz"
      sha256 "c08ed6d6be1fc2f0e8afe42af2f25d8e3b3ffccbdfaf71b74ff7cde0c6545b9b"
    end
    on_intel do
      url "https://github.com/rjcuff/woolly/releases/download/v0.18.0/woolly_linux_amd64.tar.gz"
      sha256 "4dd17435acef84ad48e60fedb96cb85d533b6d92544c2d03a2add2f9fff86cf5"
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
