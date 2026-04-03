class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.8.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "1c0042f7f367fd666ca4f9b614da2fe67626f9c8ab4d232d833f4af22120e35b"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.8.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "f81578aed327d88e53f42238f1ac6170f2e8a7120a138fa12927693e145e4aa0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.8.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "964ade86d9e1b048dd908e71b05a8db7848f134917d4a2d6e866b78cbe692abf"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.8.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8e0db94aff27aa21e75be224f8f5f38ebbeb7065513eed4392375a874a876e21"
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
