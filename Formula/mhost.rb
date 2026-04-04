class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.14.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "e045e4a3381bce05bb6711d2a88812f6c497b8143605532c05eff44d1e1e68f8"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.14.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "7c6b2fc9dfac81110d077bfcb184f083cf67b46389e2163ad3514c050be3170d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.14.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "07d9bc829a48e1409f2a45cebe6115cf9acbe5aaf40170c72e2f9f017a765e3c"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.14.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "deb0e99537e1ce9d378be2c1e395dea455bd07ca50f6518bc86e1e9f01b567cb"
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
