class GitBranchList < Formula
  desc "Maintains a list of Git branches that can be checked out quickly"
  homepage "https://github.com/teddywing/git-branch-list"
  url "https://github.com/teddywing/git-branch-list/archive/v0.1.1.tar.gz"
  sha256 "90079ea51dac1d9efa9767399443546e97301d6cc676bf4e0eb7191a231efca9"

  def install
    bin.install "git-branch-list"
    bash_completion.install "git-branch-list.bash-completion" => "git-branch-list"
  end

  def caveats; <<~EOS
    To enable tab completion, add the following to your bash profile:

        source #{etc}/bash_completion.d/git-branch-list
    EOS
  end

  test do
    assert_equal "nl: .git/info/git-branch-list: No such file or directory",
      shell_output("git branch-list 2>&1", 1).strip
  end
end
