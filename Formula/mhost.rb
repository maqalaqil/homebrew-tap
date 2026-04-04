class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.20.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "d3f1ecea23b8bb760c904d9baead97cd607a3a6d3841f0390a1188b1d2265257"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.20.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "566228bb56ca06ac7ac769f5b252d28803d7a597158d2f930c9c3b3bf50c09de"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.20.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ed358cb00772d899e60ca8697c7437582a77755efd15f599987eb5b2a4ba80c6"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.20.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "542f5e7e1a87fc76bd0088148ab6dd698d7fc0db2f63d2ba7e5d6336a84c775e"
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
