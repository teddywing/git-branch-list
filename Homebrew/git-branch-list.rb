class GitBranchList < Formula
  desc "Maintains a list of Git branches that can be checked out quickly"
  homepage "https://github.com/teddywing/git-branch-list"
  url "https://github.com/teddywing/git-branch-list/archive/v0.1.0.tar.gz"
  sha256 "b2e695f950c089d065117ce71678ec1b558b432e3b46b153d6fc920168ea54ad"

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
