class BatectZshCompletion < Formula
  desc "Zsh shell tab completion for Batect"
  homepage "https://github.com/batect/batect-zsh-completion"
  url "https://raw.githubusercontent.com/batect/batect-zsh-completion/0.4.0/_batect"
  sha256 "1660c75de063774e33aaf627e3059a8681a3785a922e065d8b5e535a9aea9933"
  license "Apache-2.0"
  head "https://raw.githubusercontent.com/batect/batect-zsh-completion/master/completions/_batect"

  def install
    zsh_completion.install "_batect"
  end

  test do
    assert_predicate zsh_completion/"_batect", :exist?
  end
end
