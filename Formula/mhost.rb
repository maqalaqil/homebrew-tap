class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.16.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "cec2a44fa9aa5423bfc08b4f2ae95fed3b5c2e61ed1798b445158ecbbbbe4100"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.16.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "983ec1fb5c2ac6911eb0c74ab60a3a560a7b774a7b003069abbdff46a3d119f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.16.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7fa8b5b311ce4826db2f220d0bad26f915dc69c095dd312542add98bd2b05c2e"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.16.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d170ca96f4bc6fbd1391114e443d8d108bc7d4a6d9bb6099123471738cac20ea"
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
