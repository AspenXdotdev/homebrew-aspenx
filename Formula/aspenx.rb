# Homebrew formula for the aspenx CLI. Rendered by scripts/release.sh into
# the AspenXdotdev/homebrew-aspenx tap:
#
#   brew install aspenxdotdev/aspenx/aspenx
class Aspenx < Formula
  desc "Parallel feature workspaces for a Docker Compose monorepo"
  homepage "https://aspenx.dev"
  version "0.9.9"

  on_macos do
    on_arm do
      url "https://aspenx.dev/releases/0.9.9/aspenx-0.9.9-darwin-arm64.tar.gz"
      sha256 "f6ad36f17d6785082ae386f60dad5897b90a84346cc7a701cb6ef6348221b02c"
    end
    on_intel do
      url "https://aspenx.dev/releases/0.9.9/aspenx-0.9.9-darwin-amd64.tar.gz"
      sha256 "e97a693a5a9c385434d4a2797c2badb5adbc84ae7eeb843dae526c9d8a41c9a8"
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
