class BatectFishCompletion < Formula
  desc "Fish shell tab completion for Batect"
  homepage "https://github.com/batect/fish-completion"
  url "https://raw.githubusercontent.com/batect/fish-completion/0.4.0/completions/batect.fish"
  sha256 "0852881e453e4b309c1a388d625ee09e306a9e86731802120291b9eeded020f5"
  license "Apache-2.0"
  head "https://raw.githubusercontent.com/batect/fish-completion/master/completions/batect.fish"

  bottle :unneeded

  def install
    fish_completion.install "batect.fish"
  end

  test do
    assert_predicate fish_completion/"batect.fish", :exist?
  end
end
