# Homebrew formula for the aspenx CLI. Rendered by scripts/release.sh into
# the AspenXdotdev/homebrew-aspenx tap:
#
#   brew install aspenxdotdev/aspenx/aspenx
class Aspenx < Formula
  desc "Parallel feature workspaces for a Docker Compose monorepo"
  homepage "https://aspenx.dev"
  version "0.9.1"

  on_macos do
    on_arm do
      url "https://aspenx.dev/releases/0.9.1/aspenx-0.9.1-darwin-arm64.tar.gz"
      sha256 "ef85a7a04da8c0ae0dbeacdbec7f92677257f4f536de5a1b9a846045e3579238"
    end
    on_intel do
      url "https://aspenx.dev/releases/0.9.1/aspenx-0.9.1-darwin-amd64.tar.gz"
      sha256 "006eb5cf45b3a6eada08d7d203d0560aba334c307ce00a5e1dc7ff8ca2781101"
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
