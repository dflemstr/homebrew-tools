class Rq < Formula
  desc "Record Query - A tool for doing record analysis and transformation"
  homepage "https://github.com/dflemstr/rq"
  url "https://github.com/dflemstr/rq/archive/v0.2.4.tar.gz"
  version "0.2.4"
  sha256 "fd4942b0ec536d09b35308035b14be64d95cf3eae18b45936b850231d1b188e9"

  head "https://github.com/dflemstr/rq.git"

  depends_on "rust" => :build
  depends_on "dflemstr/v8/v8" => :build
  depends_on "protobuf" => :recommended

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/rq"
  end

  test do
    system "cargo", "test"
  end
end

