class Rq < Formula
  desc "Record Query - A tool for doing record analysis and transformation"
  homepage "https://github.com/dflemstr/rq"
  url "https://github.com/dflemstr/rq/archive/v0.9.0.tar.gz"
  version "0.9.0"
  sha256 "d10f78ae8e83d4c810f4a8ed22206388f843e9da7699d708bfbea10024e49fbd"

  head "https://github.com/dflemstr/rq.git"

  depends_on "rust" => :build
  depends_on "dflemstr/tools/v8"
  depends_on "protobuf" => :recommended

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/rq"
  end

  test do
    system "cargo", "test"
  end
end

