class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.5.1/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "e8569aee9b6a3a81dff0f833c84b162d22d0e1ee600aee6e14b7b174fadd923f"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.5.1/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "883bbe88843006b623973c41f9bd0d91a2fea24285af3882a804562d6a0d2199"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.5.1/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "82c3025ba3a7484cb115c0b376110dbcad6e9bf26b32ecc90e64a014374c60ba"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.5.1/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8e9ad6d28dcf0fe03763530596ffbbd625b4e34cfff415b2d883ba4cecfea83d"
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
