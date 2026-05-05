class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.25.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.25.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "839b199db509aa384e1cc5674da8a4ad1501696502c2c44679ab7bc4828f68b3"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.25.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "13efc6a259d84cf26fdbd2c69a8c6498ec62c6d8319cce382079fd5f2e989a05"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.25.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3836a5394beebcf700137b4e66c6809566127738ab5eb38aeaa7c9d26f124f59"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.25.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "60a6ef9d28d6f2d2d497234fbe5dca19c9e5ad7505e70211eeba11ea181e0b97"
    end
  end

  def install
    bin.install "mhost"
    bin.install "mhostd"
    generate_completions_from_executable(bin/"mhost", "completion")
  end

  test do
    assert_match "mhost #{version}", shell_output("#{bin}/mhost --version")
  end
end
