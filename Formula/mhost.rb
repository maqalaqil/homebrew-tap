class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.9.1/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "022ff4d722d1a62007b750da7571b9b6e28fcda480996c93f38036876f7cef5e"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.9.1/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "13c8e36176650d30eff986af3471a557d38c6bd1f1587593c2e11be4b4b6112b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.9.1/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4dfc4a34f381184c28b766ebd024b14e06b437452347f9e1162a8e7527fd0613"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.9.1/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1aff18b5923b8ed5aa0483055b1146fda570ca003531fc8b26ae63b2454c0606"
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
