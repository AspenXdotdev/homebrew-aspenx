# Homebrew formula for the aspenx CLI. Rendered by scripts/release.sh into
# the AspenXdotdev/homebrew-aspenx tap:
#
#   brew install aspenxdotdev/aspenx/aspenx
class Aspenx < Formula
  desc "Parallel feature workspaces for a Docker Compose monorepo"
  homepage "https://aspenx.dev"
  version "0.9.6"

  on_macos do
    on_arm do
      url "https://aspenx.dev/releases/0.9.6/aspenx-0.9.6-darwin-arm64.tar.gz"
      sha256 "23f413c119b0e54d09a674d71ef339383125feb9c1a8d99338febba1b2488c06"
    end
    on_intel do
      url "https://aspenx.dev/releases/0.9.6/aspenx-0.9.6-darwin-amd64.tar.gz"
      sha256 "7fec8141c4e0f9a2623bcbc4c479d75b02371c598d03293e83fcf4bd9a971e5d"
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
