class Easybar < Formula
  desc "Scriptable macOS status bar with SwiftUI and Lua widgets"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.0.12/EasyBar-0.0.12.zip"
  sha256 "37aead2f7d53dd4f6be2af447775c6440d4e1aad4c6dff269c43e6d9a0c87f65"
  version "0.0.12"

  depends_on macos: :sonoma

  def install
    libexec.install "EasyBar.app"
    bin.install "easybarctl"

    (bin/"easybar").write <<~SH
      #!/bin/bash
      exec "#{libexec}/EasyBar.app/Contents/MacOS/EasyBar" "$@"
    SH
  end

  service do
    run [opt_bin/"easybar"]
    keep_alive true
    require_root false
    working_dir HOMEBREW_PREFIX
    log_path var/"log/easybar.log"
    error_log_path var/"log/easybar.log"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/easybarctl --help 2>&1")
  end
end
