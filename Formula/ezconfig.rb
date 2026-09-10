class Ezconfig < Formula
  desc "Automate multi-developer code signing setup for Xcode projects"
  homepage "https://github.com/Revanfer14/ezconfig"
  url "https://github.com/Revanfer14/ezconfig/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "fd7d5f62c3364eb3fbe04090e54d81cfd2052641935545e8841552c592b27548"
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
