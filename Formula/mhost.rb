class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.4.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "cbab1d32e427f7f9e97c8ec43d441c2b4ffaf874521043a07088b2cf50b4c243"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.4.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "be3d59e7a3235eb01cd476bd824aa76cd7ea4ad1092af06c962e0ee3b293376c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.4.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a07374eb82f93f7a5c24a6d50abab3721e1f550e14f9048c7bfd580b7e77a7c8"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.4.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e3503d5d005d5694a0861e31a37a5adf58d5b8117fe95c51875074336c81bf4e"
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
