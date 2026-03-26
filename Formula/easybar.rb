class Easybar < Formula
  desc "Scriptable macOS status bar with SwiftUI and Lua widgets"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.0.43/EasyBar-0.0.43.zip"
  sha256 "d299868e9b2ec3fa72e19e98d83cfa7519505fe0380e77e364580fccb4d728c6"
  license "Apache-2.0"
  version "0.0.43"

  depends_on macos: :sonoma
  depends_on "easybar-calendar-agent"
  depends_on "easybar-network-agent"

  def install
    libexec.install "EasyBar.app"
    bin.install "easybarctl"

    (bin/"easybar").write <<~SH
      #!/bin/bash
      exec "#{libexec}/EasyBar.app/Contents/MacOS/EasyBar" "$@"
    SH

    (var/"log/easybar").mkpath
  end

  service do
    run [opt_bin/"easybar"]
    environment_variables PATH: std_service_path_env, LANG: "en_US.UTF-8"
    keep_alive true
    process_type :interactive
    working_dir HOMEBREW_PREFIX
    log_path var/"log/easybar/easybar.out.log"
    error_log_path var/"log/easybar/easybar.err.log"
  end

  test do
    assert_match "easybarctl", shell_output("#{bin}/easybarctl --help 2>&1")
  end
end
