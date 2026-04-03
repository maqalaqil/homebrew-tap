class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.9.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "968f5893d5a8fe68a5c6f4d2ae2a97e1609ff0c03713ad8814079c4b30cec6e8"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.9.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "fb5f65118ebc068b8e9f68a87f5368522f30cdb73b3b7b3cce43457bc3188ee9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.9.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "315c725e7876001bc1f6b406afccf319a3a2891f43d94f6f185b3f4e21fc6042"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.9.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8afcedb256fc50c04f3de38a717101ef1d62cdccedcf05a985ed4f0198cf82da"
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
