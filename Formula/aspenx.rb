# Homebrew formula for the aspenx CLI. Rendered by scripts/release.sh into
# the AspenXdotdev/homebrew-aspenx tap:
#
#   brew install aspenxdotdev/aspenx/aspenx
class Aspenx < Formula
  desc "Parallel feature workspaces for a Docker Compose monorepo"
  homepage "https://aspenx.dev"
  version "0.9.8"

  on_macos do
    on_arm do
      url "https://aspenx.dev/releases/0.9.8/aspenx-0.9.8-darwin-arm64.tar.gz"
      sha256 "e4b2c5d6c235c87fec5e2bb55f16c03612dcf2696c86a56cb8b7bacad118f89e"
    end
    on_intel do
      url "https://aspenx.dev/releases/0.9.8/aspenx-0.9.8-darwin-amd64.tar.gz"
      sha256 "efd115c42a60ee56b9fd01c6dd09ae3cc6e45509e0cd9b4a4156a5650cef16b4"
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
