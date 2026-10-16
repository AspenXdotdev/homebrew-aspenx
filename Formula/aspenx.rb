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
      sha256 "1771a98c65b97c6ca72eca85d773bf4588b322b6df278fae53a7ca832432aa1e"
    end
    on_intel do
      url "https://aspenx.dev/releases/0.9.0/aspenx-0.9.0-darwin-amd64.tar.gz"
      sha256 "85ed00f45f1de885733406d6d3aaa9dba96eb9cd9c35ae1efc9096cb5986bd53"
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
