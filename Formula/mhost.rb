class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.23.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.23.2/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "1644a3c204cf4e04ed14b527e4e50eaa571a9ae64e60ed62c8dc51114890940c"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.23.2/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "30d3958742e006c3152ad4504ab2e694ceac085fa10993123a72a480a6c87ba1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.23.2/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "597c2d6c29576570c1912b2fb0a00cef7fa072379101b0df29e60956595c040e"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.23.2/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8f0e164bb47935df25c4575ea57f7f75f155f69ddfcd2c4e7b7888377f925358"
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
