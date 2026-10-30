# Homebrew formula for the aspenx CLI. Rendered by scripts/release.sh into
# the AspenXdotdev/homebrew-aspenx tap:
#
#   brew install aspenxdotdev/aspenx/aspenx
class Aspenx < Formula
  desc "Parallel feature workspaces for a Docker Compose monorepo"
  homepage "https://aspenx.dev"
  version "0.9.3"

  on_macos do
    on_arm do
      url "https://aspenx.dev/releases/0.9.3/aspenx-0.9.3-darwin-arm64.tar.gz"
      sha256 "cb93f04e71f748086f20a20d4b22e5e058935dee9a3390f4430221852ea576a4"
    end
    on_intel do
      url "https://aspenx.dev/releases/0.9.3/aspenx-0.9.3-darwin-amd64.tar.gz"
      sha256 "a18220d0a4154738bd3eac956c6006b1cb3039eeeaee809fe602e2aafb2f8a98"
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
