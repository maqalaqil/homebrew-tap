class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.21.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "28061cfe38d6ea5ac0adeab0061c56a28920e79a5bf5719070e3824468a11ab5"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.21.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "3fb94ba4dccc164ba7fe093294865abb0dbfdda7f64d1c80cba9f99e9e438482"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.21.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3942833625b0b653987ddabbc28b86c64d891f930b34d643111921990bffadda"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.21.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ce1d0fd070ea1f920c999dbd6002f8d095d6d30e244af4bcdbaaeb23428ef078"
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
