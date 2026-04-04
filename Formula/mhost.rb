class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.17.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "764ccfd896d9fc278dc359e72d914f910f7e6851861332c6a0b412bf6e464044"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.17.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "ecd92bf0d8820c95f7cdd306fbab21589f9a5b6a0c4ea8bad706c2b111b3e6cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.17.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0f9044e96e741339d32fda58498308d704dd261ebcfa4e6cfa6854dd44dcb6f4"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.17.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3aad63b4db33d14c1e50911d6dcaa73a59b6d504b43ca6d1746532d7685fdc54"
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
