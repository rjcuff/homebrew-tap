class Woolly < Formula
  desc "Local project memory for coding agents that flags stale facts"
  homepage "https://usewoolly.com"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rjcuff/woolly/releases/download/v0.15.0/woolly_darwin_arm64.tar.gz"
      sha256 "aa0be027772e36f24255598f2b938df9fe6b2b1cfc247313894444557882e84c"
    end
    on_intel do
      url "https://github.com/rjcuff/woolly/releases/download/v0.15.0/woolly_darwin_amd64.tar.gz"
      sha256 "258a34b2dce4565166efe8d2bc656ba175f06e36e360ff8328332188bfcfdf01"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rjcuff/woolly/releases/download/v0.15.0/woolly_linux_arm64.tar.gz"
      sha256 "0330955e552598ff24464394d1e16ae9da4d2c0ce18db3d8eeda2371707ecac0"
    end
    on_intel do
      url "https://github.com/rjcuff/woolly/releases/download/v0.15.0/woolly_linux_amd64.tar.gz"
      sha256 "1f0d94ab018080ce46187f0bc32d3bc00277dd5623e63b1f0a3d3105befd04b4"
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
