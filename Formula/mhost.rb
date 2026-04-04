class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.19.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "2758accbb0e5d7fa43ad6de24face9e5bf70d9391ea96c8aa2e837fcf7b4306c"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.19.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "131b0af45a59365d8ca22c686fb941a53ea539ffdb2c5b5be5bd24a97a64a71f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.19.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7f3b2ec03453aefb99620dd539ba1e338d17094ca8b2bc5cf9359913d359d420"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.19.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9a52a158579195dc7f61bd93d8ad1bec151bf20e52061d8bee8d0760be2440b0"
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
