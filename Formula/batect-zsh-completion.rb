class BatectZshCompletion < Formula
  desc "Zsh shell tab completion for Batect"
  homepage "https://github.com/batect/zsh-completion"
  url "https://raw.githubusercontent.com/batect/zsh-completion/0.1.1/completions/_batect"
  sha256 "b9a513023ab12ff7f6bb0f0940362f26eb11c720d19cef290c604eff7f83b402"
  license "Apache-2.0"
  head "https://raw.githubusercontent.com/batect/zsh-completion/master/completions/_batect"

  bottle :unneeded

  def install
    fish_completion.install "_batect"
  end

  test do
    assert_predicate fish_completion/"_batect", :exist?
  end
end
