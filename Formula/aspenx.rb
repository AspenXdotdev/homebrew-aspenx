# Homebrew formula for the aspenx CLI. Rendered by scripts/release.sh into
# the AspenXdotdev/homebrew-aspenx tap:
#
#   brew install aspenxdotdev/aspenx/aspenx
class Aspenx < Formula
  desc "Parallel feature workspaces for a Docker Compose monorepo"
  homepage "https://aspenx.dev"
  version "0.9.7"

  on_macos do
    on_arm do
      url "https://aspenx.dev/releases/0.9.7/aspenx-0.9.7-darwin-arm64.tar.gz"
      sha256 "d3043c79c2552b0facc37311b2795a85f948fc173bce59cc0afbe4ec1115a5ce"
    end
    on_intel do
      url "https://aspenx.dev/releases/0.9.7/aspenx-0.9.7-darwin-amd64.tar.gz"
      sha256 "502d4053856e3f86ddde33a1638aa78ce5c9a6aa400fff375192a03cae8bdb39"
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
