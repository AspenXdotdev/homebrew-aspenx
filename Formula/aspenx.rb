# Homebrew formula for the aspenx CLI. Rendered by scripts/release.sh into
# the AspenXdotdev/homebrew-aspenx tap:
#
#   brew install aspenxdotdev/aspenx/aspenx
class Aspenx < Formula
  desc "Parallel feature workspaces for a Docker Compose monorepo"
  homepage "https://aspenx.dev"
  version "0.9.0"

  on_macos do
    on_arm do
      url "https://aspenx.dev/releases/0.9.0/aspenx-0.9.0-darwin-arm64.tar.gz"
      sha256 "caec1c6e78c149e0d1a314082cac319b3fc440fcdd167729cf361c4e73df9bf7"
    end
    on_intel do
      url "https://aspenx.dev/releases/0.9.0/aspenx-0.9.0-darwin-amd64.tar.gz"
      sha256 "52e06f8c2f794781fb92b105e1f56416f42a3871d88af74e398eb252723dfa71"
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
