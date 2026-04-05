class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.22.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.22.1/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "dce38e264d0bbd578d5a56ac9f1c3152b9ee48ad551ba57091c351c807c4bf02"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.22.1/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "4fe80219f57197a4542965f96dc6987d6389b62471da76a9008e0d3ecc8c65e6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.22.1/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c8fc83188582ab9f0b8781258ec8d13eb74f92ba2edd79480e13fcf836ed5284"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.22.1/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1072cf994757c594a7a5192b1d30b8a337388a19ac7d02d7d90f1c15f5ca5a41"
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
