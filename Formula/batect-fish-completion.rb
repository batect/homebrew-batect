class BatectFishCompletion < Formula
  desc "Fish shell tab completion for Batect"
  homepage "https://github.com/batect/batect-fish-completion"
  url "https://github.com/batect/batect-fish-completion/archive/refs/tags/0.5.1.tar.gz"
  sha256 "0e25e10dd5f855d0ceb2443939b0b6d8a16953b643dc88e81133ec94e2a26db5"
  license "Apache-2.0"
  head "https://github.com/batect/batect-fish-completion/archive/refs/heads/main.tar.gz"

  def install
    fish_completion.install "completions/batect.fish"

    inreplace "conf.d/batect.fish", "$__fish_config_dir/completions", fish_completion
    (share/"fish"/"vendor_conf.d").install "conf.d/batect.fish"
  end

  test do
    assert_predicate fish_completion/"batect.fish", :exist?
  end
end
