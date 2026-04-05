class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.23.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.23.1/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "bbe1d79a4281b813fb3721054105b765d64d07946c363dfe00a9dcc24d828b72"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.23.1/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "cfe366f21feb9b9604222044b6e549b1d9e45c9e922851f6e828407c67f70fb5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.23.1/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9ab989977418e9d18b18c4869a4da9609037e782835e443d60762f96d7fd11dd"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.23.1/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ac01562c503d70f9a78a2f88de8c08c201b1e9d82a7fb330687927bc396f926b"
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
