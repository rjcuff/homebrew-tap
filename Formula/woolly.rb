class Woolly < Formula
  desc "Local project memory for coding agents that flags stale facts"
  homepage "https://usewoolly.com"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rjcuff/woolly/releases/download/v0.16.0/woolly_darwin_arm64.tar.gz"
      sha256 "9dccf94d12e6b7e57fe58f73ad945796c612c19a8cdbdfca2cc296a1f2921f98"
    end
    on_intel do
      url "https://github.com/rjcuff/woolly/releases/download/v0.16.0/woolly_darwin_amd64.tar.gz"
      sha256 "c6db05944b6ff12240746ee268749f84e05ba99c7bd68dc7c184aa98d35c2d70"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rjcuff/woolly/releases/download/v0.16.0/woolly_linux_arm64.tar.gz"
      sha256 "e015dd49caaf3ee8e77cb3da590feb3da7dd3311fd35450412227637f76bad12"
    end
    on_intel do
      url "https://github.com/rjcuff/woolly/releases/download/v0.16.0/woolly_linux_amd64.tar.gz"
      sha256 "c0f1dfb427496746d298cf8712da83097d869a87dd184019019567dfb33d7d1a"
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
