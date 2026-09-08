class Ezconfig < Formula
  desc "Automate multi-developer code signing setup for Xcode projects"
  homepage "https://github.com/Revanfer14/ezconfig"
  url "https://github.com/Revanfer14/ezconfig/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0735fce67136485040cf996b3eca76de1b7536f712d6ab6c17d60df9632356e7"
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
