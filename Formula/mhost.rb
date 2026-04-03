class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.11.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "079d4d20133035e238739a8d3f1f0b06a6b8ce34a272540ce8271f23606503e7"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.11.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "8a9c788bb9593618f1d3feec5986a2ef448ff25d7a4982af57693cfc73c02d0b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.11.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3c37b071f02a7bdb383cd2184a9e3fda73f452fa49f282be4e74922483895b45"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.11.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5b8fcecefe3f77cc7431a71c944ccfa408866c1f748aa91abcdd9370d30d6605"
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
