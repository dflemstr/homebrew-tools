# Track Chrome stable.
class V8 < Formula
  desc "Google's JavaScript engine"
  homepage "https://code.google.com/p/v8/"
  url "https://github.com/v8/v8/archive/5.6.222.tar.gz"
  sha256 "574592cb40d509cb490ae0f4550c5bbde2442d423adaaa9fc20db9b3d3affab0"
  head "https://github.com/v8/v8.git"

  bottle do
    cellar :any
    root_url "https://github.com/dflemstr/homebrew-tools/releases/download/v1/"
    sha256 "01f63f99a5a83b53f1f776c007a10ad4d8e066bbf4a16c3ab3265d4ab9b6458b" => :el_capitan
  end

  option "with-readline", "Use readline instead of libedit"

  # not building on Snow Leopard:
  # https://github.com/Homebrew/homebrew/issues/21426
  depends_on :macos => :lion

  depends_on "python" => :build
  depends_on :xcode => :build
  depends_on "readline" => :optional
  depends_on "icu4c" => :recommended

  needs :cxx11

  resource "depot_tools" do
    url "https://chromium.googlesource.com/chromium/tools/depot_tools.git",
    :revision => "850ce84cb68f6b428fa3a490f7b08481285fffb9"
  end

  def install
    gn_args = "is_component_build=true is_debug=false is_official_build=true v8_use_snapshot=true v8_use_external_startup_data=false"

    if build.with? "icu4c"
      gn_args << " v8_enable_i18n_support=true"
    else
      gn_args << " v8_enable_i18n_support=false"
    end

    mkdir buildpath/"v8"
    mv Dir.glob(buildpath/"{*,.*}").select {|p| !p.end_with?("/v8") && !p.end_with?(".") }, buildpath/"v8", :verbose => true
    
    (buildpath/"depot_tools").install resource("depot_tools")
    ENV.prepend_create_path "PATH", (buildpath/"depot_tools")

    system "gclient", "config", "https://github.com/v8/v8.git"
    system "gclient", "sync", "-v", "-r", "5.6.222"

    cd buildpath/"v8" do
      system "gn", "gen", "out.gn/release", "--args=" + gn_args
      system "ninja", "-C", "out.gn/release", "v8", "d8", "mksnapshot", "v8_shell"

      include.install Dir["include/*"]

      cd "out.gn/release" do
        lib.install Dir["lib*"]
        bin.install "d8", "mksnapshot", "v8_shell" => "v8"
      end
    end
  end

  test do
    assert_equal "Hello World!", pipe_output("#{bin}/v8 -e 'print(\"Hello World!\")'").chomp
  end
end
