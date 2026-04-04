class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.15.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "fadfe19da8c42740c1e52832acecd679bd74cef9a319f46441348c374b90bf36"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.15.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "5e15cb983a2f279c7e508ca08a4b5743264e1255d6666276c6e76127d98e28ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.15.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9c199c8e5cc8e3c16155728ce7cc0fbd97733add5d65e7089e3da7588c0d900d"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.15.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c5ef260e13414e83b0ff492447989ffe840c74cc289070961d7f638b9da25d3f"
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
