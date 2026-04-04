class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.12.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "7a8b5914bfd9d5d59d46d50ed841b99a543415bc8bb031a1c0e3933024f098b2"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.12.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "512c808e665e6da1c4c458484f41d4a537dd9b4723c90e80d531b743ec64664c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.12.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f8c5f4d6595d98337dfa222cbd82bcb8d2a8c8e4a5ed7391e208eabfd34ec2d4"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.12.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4116d34942d9d2d7fc5c5ab37648c3eed1af9d46e01ad3e717ad2be20f3bb2e3"
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
