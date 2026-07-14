# frozen_string_literal: true

# Local-first, fail-closed speech-to-text CLI (no cloud, no telemetry).
class Openasr < Formula
  desc "Local-first, fail-closed speech-to-text CLI (no cloud, no telemetry)"
  homepage "https://github.com/QuintinShaw/openasr"
  version "0.1.14"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/QuintinShaw/openasr/releases/download/v#{version}/openasr-#{version}-macos-arm64.tar.gz"
      sha256 "79264412f0fc2e4af180cdcdf50ccfa5f6ad6360753b0273e90de55cd8f80cdd"
    else
      odie "openasr tap currently ships macOS arm64 (Apple Silicon) only; download an x86_64 build from https://github.com/QuintinShaw/openasr/releases"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/QuintinShaw/openasr/releases/download/v#{version}/openasr-#{version}-linux-arm64.tar.gz"
      sha256 "d00c3f4e733660d56d81a3b442fa4cf83f9583684464c278d28426cf0a8dfd1a"
    else
      url "https://github.com/QuintinShaw/openasr/releases/download/v#{version}/openasr-#{version}-linux-x86_64.tar.gz"
      sha256 "7270af381ee0e8409f2b038f470f3830039c4454566ae2c3fdc307e2ec3863f8"
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
