class Easybar < Formula
  desc "Scriptable macOS status bar with SwiftUI and Lua widgets"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.2.29/EasyBar-0.2.29.zip"
  sha256 "ff9794227c4210def5791c251431cf2315d037f64c4e84e9083180b51df99a0d"
  license "Apache-2.0"
  version "0.2.29"

  depends_on macos: :sonoma
  depends_on "easybar-calendar-agent"
  depends_on "easybar-network-agent"

  def install
    libexec.install "EasyBar.app"
    bin.install "easybar"

    (var/"log/easybar").mkpath
  end

  service do
    run [opt_libexec/"EasyBar.app/Contents/MacOS/EasyBar"]
    environment_variables PATH: std_service_path_env, LANG: "en_US.UTF-8"
    keep_alive true
    process_type :interactive
    working_dir HOMEBREW_PREFIX
    log_path var/"log/easybar/easybar.out.log"
    error_log_path var/"log/easybar/easybar.err.log"
  end

  test do
    assert_match "easybar", shell_output("#{bin}/easybar --help 2>&1")
  end
end
