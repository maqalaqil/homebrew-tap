class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.1.9/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "a56495109ae271286b7e4d603b25d0866c8e34a1c91922116350cc40ef61d549"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.1.9/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "29fbccd505128fae0d800707325ec412085d45ec6d5d4edc1eec1f9c53ad43a3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.1.9/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2ace20a943e659a98984a9604d1206c4609ae7723c1e889bbfc4c04876d0966f"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.1.9/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "26daa974975d746e4084fe64358a64e04304acd81cc7f79be50b5ec8fde65ec5"
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
