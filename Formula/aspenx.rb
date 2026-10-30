# Homebrew formula for the aspenx CLI. Rendered by scripts/release.sh into
# the AspenXdotdev/homebrew-aspenx tap:
#
#   brew install aspenxdotdev/aspenx/aspenx
class Aspenx < Formula
  desc "Parallel feature workspaces for a Docker Compose monorepo"
  homepage "https://aspenx.dev"
  version "0.9.4"

  on_macos do
    on_arm do
      url "https://aspenx.dev/releases/0.9.4/aspenx-0.9.4-darwin-arm64.tar.gz"
      sha256 "399b100a5438c63ac09a1f77e8c95ca092868e0dd84d94e444eddcd53d0243e6"
    end
    on_intel do
      url "https://aspenx.dev/releases/0.9.4/aspenx-0.9.4-darwin-amd64.tar.gz"
      sha256 "67ec0d590601bda51fc6a7e3454f5c17a69f38d837ec2da2560b4d74bc306ac5"
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
