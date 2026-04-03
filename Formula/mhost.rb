class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.9.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.9.2/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "64e354b275afb84e10b54639235ea01e66d119e4a4301726e776644390fe32df"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.9.2/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "567670e878255c9691b4e0f3a4571a6c89004382a59d5baa5e445cae7e72ad9e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.9.2/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "704c16294d9c58a79fb07c15e566408e66b90f61598da76002dc02f984004531"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.9.2/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "de068bc2a2cfb081b715ae25738096333b21c7cdf679293a3be48e10e16db93e"
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
