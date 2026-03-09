class Gplaces < Formula
  desc "Terminal based Gemini client"
  homepage "https://github.com/dimkr/gplaces"
  url homepage,
      tag:        "v0.20.3",
      branch:     "gemini",
      revision:   "a5a789e2e76e8a83bd4edcdf52a0fe4b770cc5fe",
      using:      :git,
      submodules: true
  license "GPL-3.0-or-later"

  depends_on "pkgconf" => :build
  depends_on "curl"
  depends_on "libidn2"
  depends_on "libmagic"
  depends_on "openssl@3"

  def install
    system "make", "gplaces", "gplacesrc", "VERSION=#{version}", "PREFIX=#{prefix}", "CONFDIR=#{etc}", "DOCDIR=#{doc}"
    bin.install "gplaces"
    man1.install "gplaces.1"
    etc.install "gplacesrc"
    doc.install "README.md" => "README.gmi"
    doc.install "LICENSE"
    doc.install "AUTHORS"
  end

  test do
    assert_match "gplaces - #{version}", pipe_output("#{bin}/gplaces", "version\n")
    assert_path_exists man1/"gplaces.1"
    assert_path_exists etc/"gplacesrc"
  end
end
