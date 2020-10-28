class BatectFishCompletion < Formula
  desc "Fish shell tab completion for batect"
  homepage "https://github.com/batect/fish-completion"
  url "https://raw.githubusercontent.com/batect/fish-completion/0.3.0/completions/batect.fish"
  sha256 "6d5f3831a9636b984327d48bb9373b66664e60b1a4d037203f432f4c52435140"
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
