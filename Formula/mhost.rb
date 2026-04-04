class Mhost < Formula
  desc "AI-powered process manager written in Rust"
  homepage "https://github.com/maqalaqil/mhost"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.13.0/mhost-aarch64-apple-darwin.tar.gz"
      sha256 "44211194eb99778be0359f4d6735248a4eb0708652050b7d6013976954d4d461"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.13.0/mhost-x86_64-apple-darwin.tar.gz"
      sha256 "39488137f658720a32eb57eadcc8447727c1e52c5e94c299bfc8ca3b8df716f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/maqalaqil/mhost/releases/download/v0.13.0/mhost-aarch64-unknown-linux-musl.tar.gz"
      sha256 "258e7124e767e04d8a61d833cb21ee80cd27d458b5a0f5bd1384cd24e67bb9b6"
    else
      url "https://github.com/maqalaqil/mhost/releases/download/v0.13.0/mhost-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b93e1aaa4929effcf0b9ccfbe82731da17b18d6feb449e7b8ba3283a4c9bdbc6"
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
