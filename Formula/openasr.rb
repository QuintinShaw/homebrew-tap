# frozen_string_literal: true

# Local-first, fail-closed speech-to-text CLI (no cloud, no telemetry).
class Openasr < Formula
  desc "Local-first, fail-closed speech-to-text CLI (no cloud, no telemetry)"
  homepage "https://github.com/QuintinShaw/openasr"
  version "0.1.17"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/QuintinShaw/openasr/releases/download/v#{version}/openasr-#{version}-macos-arm64.tar.gz"
      sha256 "c48a18077339b0826438c6ae2e40c433a9fa9072778f9eca3814cfc1d0e49ffe"
    else
      odie "openasr tap currently ships macOS arm64 (Apple Silicon) only; download an x86_64 build from https://github.com/QuintinShaw/openasr/releases"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/QuintinShaw/openasr/releases/download/v#{version}/openasr-#{version}-linux-arm64.tar.gz"
      sha256 "e391bddae25152df998b63c98def39a8d74382839d96ddc860b7b23ba08f4769"
    else
      url "https://github.com/QuintinShaw/openasr/releases/download/v#{version}/openasr-#{version}-linux-x86_64.tar.gz"
      sha256 "6f7ad450678faf871145e8f58e19cab2950fd3c4ef87699b65e0214b32b991f5"
    end
  end

  def install
    bin.install "openasr"
    doc.install "README.md"
    doc.install "docs/FAQ.md" => "FAQ.md"
    doc.install "docs/KNOWN_LIMITATIONS.md" => "KNOWN_LIMITATIONS.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/openasr --version")
  end
end
