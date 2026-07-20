# frozen_string_literal: true

# Local-first, fail-closed speech-to-text CLI (no cloud, no telemetry).
class Openasr < Formula
  desc "Local-first, fail-closed speech-to-text CLI (no cloud, no telemetry)"
  homepage "https://github.com/QuintinShaw/openasr"
  version "0.1.20"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/QuintinShaw/openasr/releases/download/v#{version}/openasr-#{version}-macos-arm64.tar.gz"
      sha256 "9fe3151d75e5e88ccb945ec2e56855be69ee80dc279d524dc863effa0393ba22"
    else
      odie "openasr tap currently ships macOS arm64 (Apple Silicon) only; download an x86_64 build from https://github.com/QuintinShaw/openasr/releases"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/QuintinShaw/openasr/releases/download/v#{version}/openasr-#{version}-linux-arm64.tar.gz"
      sha256 "f837b23a77045cd81be9a971b53126a52bdcfd72c6d08ea6fb0efcdf461bd8a2"
    else
      url "https://github.com/QuintinShaw/openasr/releases/download/v#{version}/openasr-#{version}-linux-x86_64.tar.gz"
      sha256 "0562f5383041f1cc2c8c09afd505a24dd44a0e201b6a16a9dd32c7dc610d30c2"
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
