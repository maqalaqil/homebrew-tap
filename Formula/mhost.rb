class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.17.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.17.1/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "3a74fe4dda9f5539f068b2eeebfd963f7322ea2f6e893741a4ca7ee396dc5e5b"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.17.1/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "a0d97d53d7b87cdb38366c00babb4e345988f106678adaed5f78064392f41df0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.17.1/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1ce005befd1ee6f88cf09e6c56ec601cefcf52d4f635c82e5648117d20d6c24d"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.17.1/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8ee6994e29b144e83c3e34b0b1efc77b1849ee156590a72a71ff4415b648b86d"
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
