# frozen_string_literal: true

# Local-first, fail-closed speech-to-text CLI (no cloud, no telemetry).
class Openasr < Formula
  desc "Local-first, fail-closed speech-to-text CLI (no cloud, no telemetry)"
  homepage "https://github.com/QuintinShaw/openasr"
  version "0.1.27"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/QuintinShaw/openasr/releases/download/v#{version}/openasr-#{version}-macos-arm64.tar.gz"
      sha256 "0c90d79e862486f1ba6d6bb1cb995d19329351c8f9b4f40b69f274ecfba693d9"
    else
      odie "openasr tap currently ships macOS arm64 (Apple Silicon) only; download an x86_64 build from https://github.com/QuintinShaw/openasr/releases"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/QuintinShaw/openasr/releases/download/v#{version}/openasr-#{version}-linux-arm64.tar.gz"
      sha256 "844b5a5381848dfd11ed8f6daac027e3c63622a27ed2dda12e693bb8496f1c4e"
    else
      url "https://github.com/QuintinShaw/openasr/releases/download/v#{version}/openasr-#{version}-linux-x86_64.tar.gz"
      sha256 "a7580a2e1759f87bd2c3995f31bdd25350d79d8cceea17388e3e24ee8c6ea559"
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
