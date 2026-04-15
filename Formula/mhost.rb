class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.24.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.24.1/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "55fd4672a82b993ff33f7b0977b77ea78897dbd554e2b99c07b633df3eb38b43"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.24.1/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "9edcd4255e22c8b964800efbe6b719e561b4b53b773f9cbf2f67d90cc1bb56b0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.24.1/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "69e831ae176ca49fc332530689cf1462a139d279cf06d2c1e400dfefd3174918"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.24.1/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0e23d7e3fb7ea294c14336991585d27e96cf9b0a052f0acbf9c0f01578ce2875"
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
