class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.22.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "0567a9a475e0c66f4639deec28cf3d233488b3ece03e4a25aaf4ce503f0928cf"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.22.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "fbf746bd5df12134040e913db5fbdf89ad1d6eeef08aea62a590246656f18089"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.22.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ab114de8543c24ff13edcdca34d2115d7c08c0a55b56cc1969262511be93db34"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.22.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "58eb6e765129838bf209effa328c36893c1f65932b6d1dcac0660329b25f0967"
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
