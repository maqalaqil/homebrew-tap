class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.12.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.12.1/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "f042153d93558869a57d21be1dad56a77bcea1886580ff2aa85eb26e1330e430"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.12.1/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "dda433cb31c24a0567e83db04623975dd61e3e3266526ddc819a3d011a3d5ad2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.12.1/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dd1a2ad6732ba88ba8ed571e64b374e70c572ea36a9d17abee939848061aaecb"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.12.1/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3c8eaa07aa05f53b92c94bd8743b0641a707881b6256c1f6a8271ca10cd41d4d"
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
