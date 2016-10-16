class Rq < Formula
  desc "Record Query - A tool for doing record analysis and transformation"
  homepage "https://github.com/dflemstr/rq"
  url "https://github.com/dflemstr/rq/archive/v0.6.0.tar.gz"
  version "0.6.0"
  sha256 "b54a3c02f47b11660ebe3525fad8aed52a7fb3aae4fc56c5a910d13ab938c345"

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

