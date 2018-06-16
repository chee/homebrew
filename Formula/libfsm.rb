class Libfsm < Formula
  desc "libfsm and friends: NFA, DFA, regular expressions and lexical analysis"
  homepage "https://github.com/kate/libfsm"
  url "https://github.com/katef/libfsm/archive/cb03cca68263d939584ec3d50e07152ce3824c38.zip"
  sha256 "cf8c1c448d2e96bfc7db9d24e58d67747b44af913fe7ed8554f5c9b580913505"
	head "https://github.com/katef/libfsm.git"

	depends_on "bmake" => :build

	def install
    ENV["CC"] = ENV["HOMEBREW_CC"]
		ENV["PREFIX"] = prefix
		ENV["MANDIR"] = man

		system "bmake", "-r"
		system "bmake", "-r", "install"
	end

	test do
    shell = Shell.new
		shell.system("re", "-p", "charming", "cheerful") | sh.system("fsm -ldot")
	end
end
