class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.5.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "5b9dd9f598345efa00889a95b8d1d1629cce7c4c2e3547c8fec82ba81ee45e8f"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.5.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "45f16a410b5dbc13f192bee954f94852c4530b493508f5c5c63d7878f028516d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.5.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "efdd63b50bd292423678622d7b34663fc1431c5aa4bf94e4931ffd7c9e9b6b83"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.5.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8f60eb2c4f8d8e8fa09a98f42fc01bfed9dd88bfb6257a092c72b2a8b2045443"
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
