class Journalscript < Formula
  desc "Interactive command-line journaling tool"
  homepage "https://github.com/al3jandr0/journalscript"
  url "https://github.com/al3jandr0/journalscript/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "335d41c1d8dba10ad310d5a00f94714e2798b24f7750866caca9804a40472e23"
  license "MIT"
  # TODO: this is to run test only, you could run test if youd liek but you must make your tets
  # environment independet.  That is to reset Env var --- Actually. to laucn test with emptu Env
  #depends_on "bats" => [:test]
  depends_on "bash"
  depends_on "coreutils"
 
  def install
    bin.install "src/journal.sh" => "journal"
    prefix.install "README.md"
    prefix.install "LICENSE"
    man.mkpath
    man1.install "journalscript.1" => "journalscript.1"
  end

  test do
    assert_equal "journalscript 0.0.2", shell_output(" #{bin}/journal -v").strip
end
end