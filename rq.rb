class Rq < Formula
  desc "Record Query - A tool for doing record analysis and transformation"
  homepage "https://github.com/dflemstr/rq"
  url "https://github.com/dflemstr/rq/archive/v0.9.2.tar.gz"
  version "0.9.2"
  sha256 "2c6564a8507aafd08885adabbe052b820ac77f830edafe4fdae09629d6241b28"

  head "https://github.com/dflemstr/rq.git"

  bottle do
    cellar :any
    root_url "https://github.com/dflemstr/homebrew-tools/releases/download/v2/"
    sha256 "0d4caab2f8ae7d89b0da826bf1a28e2348e7e3a3755945a7e73ed2a6d0bd124b" => :el_capitan
  end

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

