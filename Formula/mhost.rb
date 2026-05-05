class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.24.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.24.3/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "06723b7af89490bd8fec95f74d8ed221b220673a5df53668556b9c2e47241f18"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.24.3/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "954db2abf98b43066c7558986819c92a587319d27d6517e21a363d33041488da"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.24.3/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "46409d91e7e7f2b3bf999440861bc46ed8441c9d3844bf5f1d692574352695c0"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.24.3/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fd0a53f235c0c33db28a8e7aff29f966af6037532e03d2aeb18854a72eac9e24"
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
