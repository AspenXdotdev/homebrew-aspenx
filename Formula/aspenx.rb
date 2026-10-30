# Homebrew formula for the aspenx CLI. Rendered by scripts/release.sh into
# the AspenXdotdev/homebrew-aspenx tap:
#
#   brew install aspenxdotdev/aspenx/aspenx
class Aspenx < Formula
  desc "Parallel feature workspaces for a Docker Compose monorepo"
  homepage "https://aspenx.dev"
  version "0.9.5"

  on_macos do
    on_arm do
      url "https://aspenx.dev/releases/0.9.5/aspenx-0.9.5-darwin-arm64.tar.gz"
      sha256 "7ac322b7133554919c1d323414e20d18bfc95a24903121b6c5f358bccedacaa9"
    end
    on_intel do
      url "https://aspenx.dev/releases/0.9.5/aspenx-0.9.5-darwin-amd64.tar.gz"
      sha256 "142f12c5d8934afaf9bd08b0942f759f6ca980744021a4539835fc1ff553c06c"
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
