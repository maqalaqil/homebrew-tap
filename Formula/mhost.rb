class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.21.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.21.2/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "4c221bbc9ad7a9b4b9bfefa81682123501bc022e55fd538dc00d7daa51fd01c0"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.21.2/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "494a6a64176e6bdf9cbbe1f1ef95f52c4ec37dd36c888cb42d173ce88393328c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.21.2/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9ecc80ec7d3e51f8fccac6fe125543a602139fc75e01637251c148d0867d7f66"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.21.2/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "97a7dfc73b4c1278dfd3959f0f7ac8d423f90c62a6a246de21dc7a6b32dfdf8f"
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
