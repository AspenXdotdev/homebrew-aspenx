# Homebrew formula for the aspenx CLI. Rendered by scripts/release.sh into
# the AspenXdotdev/homebrew-aspenx tap:
#
#   brew install aspenxdotdev/aspenx/aspenx
class Aspenx < Formula
  desc "Parallel feature workspaces for a Docker Compose monorepo"
  homepage "https://aspenx.dev"
  version "0.9.2"

  on_macos do
    on_arm do
      url "https://aspenx.dev/releases/0.9.2/aspenx-0.9.2-darwin-arm64.tar.gz"
      sha256 "523c75312530c59ee2027fa0d7e8126ac667a102696e243fdd5da58373551bbb"
    end
    on_intel do
      url "https://aspenx.dev/releases/0.9.2/aspenx-0.9.2-darwin-amd64.tar.gz"
      sha256 "00d4c477d40a4949dc98934183620b404dc34907da3dbdc753e5bef9c831e269"
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
