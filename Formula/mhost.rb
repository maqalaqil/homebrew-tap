class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.24.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.24.2/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "74c102802115e42ffeaa0c3748d7bb2bd502a23a1972777565ea69ab9382748b"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.24.2/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "7164f754273267044267cd9b137cde22a86f62b2244c56416f4d57f8df64ee30"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.24.2/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "484f0a4a4efe92574e23870ccf857b2533cad20e2bd7287d8e320372db42a7a7"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.24.2/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "da547eeae5a4226d23ac9c500fb5d48d273acaa945a4e746c6b82173117a5795"
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
