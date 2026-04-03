class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.7.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "66cd85cc1f9c6e0688215cf9576b26d0566d5bacb02cac64b1a1ac5288cd3e12"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.7.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "56103b60721dbfc4e155347bf2ab88ec9a7ef80736a776936f94fc9d08056cff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.7.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c753c236fd08abe06bccf39571e1549cfce23f9fd75d9e686ca01b8e19ba1380"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.7.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d38912d9c699947e353fef5ab6d3c7fa0c52d030b905357bc22ffd8ca55d13f2"
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
