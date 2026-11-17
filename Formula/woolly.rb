class Woolly < Formula
  desc "Local memory for your AI tools"
  homepage "https://usewoolly.com"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rjcuff/woolly/releases/download/v0.14.0/woolly_darwin_arm64.tar.gz"
      sha256 "018e9ff99517a8c2374bb8c41915a29f8ea7e586355ea80f7c4c568f3e7aee85"
    end
    on_intel do
      url "https://github.com/rjcuff/woolly/releases/download/v0.14.0/woolly_darwin_amd64.tar.gz"
      sha256 "c8170100eb76f69122e0451cf82e6a4b35af4ca53fd338dcc86dedda791e23a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rjcuff/woolly/releases/download/v0.14.0/woolly_linux_arm64.tar.gz"
      sha256 "ad2a929bbdde7b7b10955b0707bb629e7af312d6b5100181577bc7fbabb28a6c"
    end
    on_intel do
      url "https://github.com/rjcuff/woolly/releases/download/v0.14.0/woolly_linux_amd64.tar.gz"
      sha256 "b7982b3fd1b3451e3c7fe2cb7ace93c07d5346d36b0cf97b5d5a585b7af7150b"
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
