class BatectFishCompletion < Formula
  desc "Fish shell tab completion for Batect"
  homepage "https://github.com/batect/batect-fish-completion"
  url "https://raw.githubusercontent.com/batect/batect-fish-completion/0.5.0/completions/batect.fish"
  sha256 "d2540f2cf88ddd40c16f89204569f2e85612ff59d5e41d465fac7be231388d85"
  license "Apache-2.0"
  head "https://raw.githubusercontent.com/batect/batect-fish-completion/master/completions/batect.fish"

  bottle :unneeded

  def install
    fish_completion.install "batect.fish"
  end

  test do
    assert_predicate fish_completion/"batect.fish", :exist?
  end
end
