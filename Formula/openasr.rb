# frozen_string_literal: true

# Local-first, fail-closed speech-to-text CLI (no cloud, no telemetry).
class Openasr < Formula
  desc "Local-first, fail-closed speech-to-text CLI (no cloud, no telemetry)"
  homepage "https://github.com/QuintinShaw/openasr"
  version "0.1.25"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/QuintinShaw/openasr/releases/download/v#{version}/openasr-#{version}-macos-arm64.tar.gz"
      sha256 "bec882d1040e0518dda10112d85021bd61c3f0eb8abb2f166f051bebfa33dc04"
    else
      odie "openasr tap currently ships macOS arm64 (Apple Silicon) only; download an x86_64 build from https://github.com/QuintinShaw/openasr/releases"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/QuintinShaw/openasr/releases/download/v#{version}/openasr-#{version}-linux-arm64.tar.gz"
      sha256 "53d4362e7166b69d94b9e257f5a5dbfe5c3650f4a1afe0c9a499dfb66e14323d"
    else
      url "https://github.com/QuintinShaw/openasr/releases/download/v#{version}/openasr-#{version}-linux-x86_64.tar.gz"
      sha256 "beab9883453e6009f4da8d2b094bf5cbfa24ba1e897084b86c0d84597bda139c"
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
