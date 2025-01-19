class GitSv < Formula
  desc "Semantic versioning tool for git based on conventional commits"
  homepage "https://github.com/thegeeklab/git-sv"
  url "https://github.com/thegeeklab/git-sv/archive/refs/tags/v1.0.10.tar.gz"
  sha256 "2b04befbf2b2b31d77993ab0aef7b2ccc4b2a5e2fe22b7fa61267324e611a5c5"
  license "MIT"
  head "https://github.com/thegeeklab/git-sv.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "go" => :build

  def install
    build_date = Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
    ldflags = "-s -w -X main.BuildVersion=v#{version} -X main.BuildDate=#{build_date}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/git-sv"
  end

  test do
    assert_match "git-sv - Semantic version for git", shell_output("#{bin}/git-sv --help")
    system "#{bin}/git-sv", "--version"
  end
end
