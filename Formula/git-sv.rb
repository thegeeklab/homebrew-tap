class GitSv < Formula
  desc "Semantic versioning tool for git based on conventional commits"
  homepage "https://github.com/thegeeklab/git-sv"
  url "https://github.com/thegeeklab/git-sv/archive/refs/tags/v2.1.2.tar.gz"
  sha256 "2c9286a12a118bc8e369a134f3890048421f4a0ddb1640ba990767ac7aa118ae"
  license "MIT"
  head "https://github.com/thegeeklab/git-sv.git", branch: "main"

  # cspell:words livecheck
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
