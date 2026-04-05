class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.23.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.23.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "6c54bdcf38509f618bd415178822c513a1c67f0bf87194cf63af161d7c11b78f"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.23.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "e076ad086afbc2f33dc4d399ec8378c17243a9a05f16204f7c967e2bb428a326"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.23.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "34bbad569826d0f531ef4dd0a58ba6e9e854a1112a578dde1ab2f526155d223f"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.23.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "506c36f58d6f568b2a6c7a29caa3b763edfb731c624727c128e78ec4c98358ce"
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
