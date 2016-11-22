class Rq < Formula
  desc "Record Query - A tool for doing record analysis and transformation"
  homepage "https://github.com/dflemstr/rq"
  url "https://github.com/dflemstr/rq/archive/v0.8.0.tar.gz"
  version "0.8.0"
  sha256 "a83727cc4a8e2b4b775bdea539774c8065e50d64d082de7d18525e880e403589"

  head "https://github.com/dflemstr/rq.git"

  depends_on "rust" => :build
  depends_on "dflemstr/tools/v8" => :build
  depends_on "protobuf" => :recommended

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/rq"
  end

  test do
    system "cargo", "test"
  end
end

