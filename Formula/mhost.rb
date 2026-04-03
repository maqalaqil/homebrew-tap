class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.6.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "a662ef83cdf17553c0ab6961267d4fa221c2ea2c2cd7e1fbf5a6b3c703346c8e"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.6.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "e85be0b339f329278befae81d8a0b73f7e69dbfa1b90afb70eeeef99a2436246"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.6.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bff709d942edbeac69d857b2d6943510ff94661dbbc917cb413e0203e63eb665"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.6.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8671ce8b25e591a3f9cd7ab84ecc6eafa172c8b6af38a13cb1adcd2ed6cdfa22"
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
