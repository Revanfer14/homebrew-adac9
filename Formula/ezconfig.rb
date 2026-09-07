class Ezconfig < Formula
  desc "Automate multi-developer code signing setup for Xcode projects"
  homepage "https://github.com/Revanfer14/ezconfig"
  url "https://github.com/Revanfer14/ezconfig/archive/refs/tags/0.9.0.tar.gz"
  sha256 "087c15649eb147a64abeb370dcd82bb0187f4ae0e2084de473a2dc7930278a8b"
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
