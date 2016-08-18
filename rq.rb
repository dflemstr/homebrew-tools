class Rq < Formula
  desc "Record Query - A tool for doing record analysis and transformation"
  homepage "https://github.com/dflemstr/rq"
  url "https://github.com/dflemstr/rq/archive/v0.2.2.tar.gz"
  version "0.2.2"
  sha256 "a75f3a187cf0d90f345a3fb43db2a3b13bb5d7d792e7647a404bcbabd04b4172"

  head "https://github.com/dflemstr/rq.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "c4ab7d8e4aff2b0fbbdc821c62e5a8f49c591699a4fc4bf4ea94fc0d0972dfaf" => :el_capitan
  end

  depends_on "rust" => :build
  depends_on "protobuf" => :recommended

  def install
    system "cargo", "build", "--release"
    bin.install "target/release/rq"
  end

  test do
    system "cargo", "test"
  end
end

