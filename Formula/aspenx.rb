# Homebrew formula for the aspenx CLI. Rendered by scripts/release.sh into
# the AspenXdotdev/homebrew-aspenx tap:
#
#   brew install aspenxdotdev/aspenx/aspenx
class Aspenx < Formula
  desc "Parallel feature workspaces for a Docker Compose monorepo"
  homepage "https://aspenx.dev"
  version "0.9.10"

  on_macos do
    on_arm do
      url "https://aspenx.dev/releases/0.9.10/aspenx-0.9.10-darwin-arm64.tar.gz"
      sha256 "ec643fab75f0473e27d77118c9d820abc890fcb8f5778d9c0c01ea2959898e31"
    end
    on_intel do
      url "https://aspenx.dev/releases/0.9.10/aspenx-0.9.10-darwin-amd64.tar.gz"
      sha256 "b7488c7bebf5394e02053052ecb54c9aaf6f60f90df473b36fac45eb62d47589"
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
