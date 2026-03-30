class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.2.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "fe37f9ef6bf716bbbb6970e697554ff8433aacc120ba55e33c6b57ce2f0f1886"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.2.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "2383a771d67310d42b198387f2ddb12a822928f2757ff20f31a981bcbdcbfe79"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.2.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bb8dbe2db1c839577bc2565a7f4ae73488609b5fe036646baca115022fc6ca72"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.2.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "538d4f26ee8eefea643e28295ddffac5d8a64c68c44fa399f64d78e9ac62c664"
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
