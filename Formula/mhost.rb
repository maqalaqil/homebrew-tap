class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.10.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "bad72a07cb48dc95ea25efa7edee4e029ce9f0d04426b1b017e99f0b9105f485"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.10.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "5134bba675b7796817a07ddb6c15e1a065df0c1a4e79925ba968e17ced92db46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.10.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "879c36adff10671baaec6f89c6d607db80d0e81dee920444245c97caa40d7290"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.10.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d95dbf412d2c24c41704d3d91dac167a683dac067d0bda3f12397c1d04cd0e2d"
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
