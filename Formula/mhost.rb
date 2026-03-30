class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.1.8/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "44e3f7086c35efdffb1bd19c28145efd11dea8df67adb15fd87db017f5cf39e9"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.1.8/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "2ea79ad2acc7d93beb3235cc75555f4a4c02cac794d1522bff96b25256a59154"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.1.8/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cc06eea9ac0b558d0c7e5136f589bd362a7e24edeab1e0afa82f3cbcd1ada47f"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.1.8/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0aaec1986533652ba8aea4b89e32a965e59cdbe2942831ccc73b5ef39683b7f8"
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
