class Rq < Formula
  desc "Record Query - A tool for doing record analysis and transformation"
  homepage "https://github.com/dflemstr/rq"
  url "https://github.com/dflemstr/rq/archive/v0.9.1.tar.gz"
  version "0.9.1"
  sha256 "e93b6800ef7a7c5915af803d909c9924a420c4b9a36d8f590cfab953957ece4b"

  head "https://github.com/dflemstr/rq.git"

  depends_on "rust" => :build
  depends_on "dflemstr/tools/v8"
  depends_on "protobuf" => :recommended

  def install
    system "cargo", "build", "--release", "--features=shared"
    bin.install "target/release/rq"
  end

  test do
    system "cargo", "test"
  end
end

