class BatectZshCompletion < Formula
  desc "Zsh shell tab completion for Batect"
  homepage "https://github.com/batect/zsh-completion"
  url "https://raw.githubusercontent.com/batect/batect-zsh-completion/0.3.0/_batect"
  sha256 "2199b1e349c1a6d1460e9eea22e382243f14f22a4b8fb57e9be265dbab1af66b"
  license "Apache-2.0"
  head "https://raw.githubusercontent.com/batect/zsh-completion/master/completions/_batect"

  bottle :unneeded

  def install
    zsh_completion.install "_batect"
  end

  test do
    assert_predicate zsh_completion/"_batect", :exist?
  end
end
