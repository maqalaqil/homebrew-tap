class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.24.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.24.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "f90d56589ea68fe7e36ded550227ef0c71bb20521cc0821353db4779602fe995"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.24.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "5034b20e06d6214e4d30d34585f7f31b76a143554cc0e6b0b1fe41fe322d1ef5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.24.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0e8726f1ed7e2a082e89e6a33b3fa513341d76c4650c7f3aafeba270e241fe81"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.24.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "85ba8518f2611b2bea64b22ba5ba9841067d469007ebb050c50bfe78225d5332"
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
