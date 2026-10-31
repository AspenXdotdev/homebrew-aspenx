# Homebrew formula for the aspenx CLI. Rendered by scripts/release.sh into
# the AspenXdotdev/homebrew-aspenx tap:
#
#   brew install aspenxdotdev/aspenx/aspenx
class Aspenx < Formula
  desc "Parallel feature workspaces for a Docker Compose monorepo"
  homepage "https://aspenx.dev"
  version "0.9.11"

  on_macos do
    on_arm do
      url "https://aspenx.dev/releases/0.9.11/aspenx-0.9.11-darwin-arm64.tar.gz"
      sha256 "1837529b181b116f0f0576ed9fb100954ac0951a12d536f81122119e8a0de716"
    end
    on_intel do
      url "https://aspenx.dev/releases/0.9.11/aspenx-0.9.11-darwin-amd64.tar.gz"
      sha256 "ac393f2019f5be08eccf9206b37c28e0592d140577c85358c43203eabc43020c"
    end
  end

  def install
    bin.install "aspenx"
  end

  def caveats
    <<~EOS
      Next:
        aspenx init --monorepo <path to your monorepo>

      Docker, git and Claude Code are required. Optional, for PRs, tunnels
      and notifications:
        brew install gh cloudflared terminal-notifier

      The desktop app: https://aspenx.dev/docs/install/
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aspenx version")
  end
end
