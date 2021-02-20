class BatectZshCompletion < Formula
  desc "Zsh shell tab completion for Batect"
  homepage "https://github.com/batect/zsh-completion"
  url "https://raw.githubusercontent.com/batect/zsh-completion/0.2.0/completions/_batect"
  sha256 "471dd8f2978be8e8f3860ca8e6372f586274372ef4ab0bfdca21f68c5837577b"
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
