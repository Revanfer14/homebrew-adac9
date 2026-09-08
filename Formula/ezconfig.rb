class Ezconfig < Formula
  desc "Automate multi-developer code signing setup for Xcode projects"
  homepage "https://github.com/Revanfer14/ezconfig"
  url "https://github.com/Revanfer14/ezconfig/archive/refs/tags/0.9.1.tar.gz"
  sha256 "77e3e6ccb56b173057f5e913bf797623aa7067c7d7861863e0870d8ad022778c"
  license "MIT"

  depends_on xcode: ["16.0", :build]

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/ezconfig"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ezconfig --version")
  end
end
