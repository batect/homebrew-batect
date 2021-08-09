class BatectBashCompletion < Formula
  desc "Bash shell tab completion for Batect"
  homepage "https://github.com/batect/batect-bash-completion"
  url "https://raw.githubusercontent.com/batect/batect-bash-completion/0.1.0/batect.bash"
  sha256 "cf151d9fa7749a8b156df1163e78925e61449779c0b9c028f719b675b54230b9"
  license "Apache-2.0"
  head "https://raw.githubusercontent.com/batect/batect-bash-completion/master/batect.bash"

  bottle :unneeded

  def install
    bash_completion.install "batect.bash"
  end

  test do
    assert_predicate bash_completion/"batect.bash", :exist?
  end
end
