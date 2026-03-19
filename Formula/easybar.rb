class Easybar < Formula
  desc "Scriptable macOS status bar with SwiftUI and Lua widgets"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.0.23/EasyBar-0.0.23.zip"
  sha256 "3acd25fa9dd7566244d61d4c072a4c2b752301cf0d3f22f9cbfb25bb45543cab"
  license "Apache-2.0"
  version "0.0.23"

  depends_on macos: :sonoma

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
    environment_variables(
      PATH: std_service_path_env,
      LANG: "en_US.UTF-8",
      EASYBAR_DEBUG: "0",
    )
    keep_alive true
    process_type :interactive
    working_dir HOMEBREW_PREFIX
    log_path var/"log/easybar/easybar.out.log"
    error_log_path var/"log/easybar/easybar.err.log"
  end

  test do
    assert_match "usage:", shell_output("#{bin}/easybarctl --help 2>&1")
  end
end
