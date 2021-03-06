class Xmlsectool < Formula
  desc "Check schema validity and signature of an XML document"
  homepage "https://wiki.shibboleth.net/confluence/display/XSTJ2/xmlsectool+V2+Home"
  url "https://shibboleth.net/downloads/tools/xmlsectool/latest/xmlsectool-2.0.0-bin.zip"
  sha256 "83ea1e977d947dd5f2f5600a3280bc5d372a4913f0dbce1ddf2c0ca1c869ca57"
  revision 1

  bottle :unneeded

  depends_on "openjdk"

  def install
    prefix.install "doc/LICENSE.txt"
    rm_rf "doc"
    libexec.install Dir["*"]
    (bin/"xmlsectool").write_env_script "#{libexec}/xmlsectool.sh", JAVA_HOME: Formula["openjdk"].opt_prefix
  end

  test do
    system "#{bin}/xmlsectool", "--listBlacklist"
  end
end
