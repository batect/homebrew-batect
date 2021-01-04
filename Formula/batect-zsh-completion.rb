class BatectZshCompletion < Formula
  desc "Zsh shell tab completion for Batect"
  homepage "https://github.com/batect/zsh-completion"
  url "https://raw.githubusercontent.com/batect/zsh-completion/0.1.2/completions/_batect"
  sha256 "2ebeebab354063574fce06fe1d0902f6204e32ddb312387254276dd60eddd683"
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
