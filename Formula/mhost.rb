class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.3.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "7e1bde0250632e003bb01fe39140a6781eeb5ce2a5a41dfbf318f361a5df56af"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.3.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "87d3eca37e506f684afdecd43a55fdaab8e0c09d9257b6cdcc4c93273878bc5a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.3.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7e0a618dbe81396d2200167c908d2746c2c58590600d6d8f6d3cba63036a1878"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.3.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e32f95abe9b3836e4e88a5a6c2d7c69d9c0076aaed1bdaf62bbf9b539f57eaa2"
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
