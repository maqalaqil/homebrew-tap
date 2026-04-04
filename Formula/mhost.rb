class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.18.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "d10cc9164b6e39d4c020288e3f4cc1e9fbef9822b8414eaf34ca98247ba5f5b1"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.18.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "54376842f458fba7a8f9f21e4901c2b40199aaee3a777e109c9cc0148591aaff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.18.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d456b2a53034e6b3cd95ca342ec727c426670b7202858192fba3de66d5dfb55c"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.18.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "aee798515ab5b657dec04b894dfa90359a8a89b81f76e0a1f0328ddbff91c10b"
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
