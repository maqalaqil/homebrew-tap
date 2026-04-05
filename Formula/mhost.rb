class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.21.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.21.1/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "3a896e4a54d0c52b734ba4bf0305546cfbcdc16a9b52ae4bafe9f1e1a3014859"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.21.1/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "a6b325eaab2b5bb6e3410182aec6f692e2a505b65158b86c0d25a91f5ea6d95c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.21.1/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1dc5f38507896b582c7be92679fcc62f5fc3aa5370d73d44a385fac3432b27d2"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.21.1/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d4966243b76f069e0335bb833ad4c1f5d43d3a6e6f361bf02165316c8322555a"
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
