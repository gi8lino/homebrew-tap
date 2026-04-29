class Wifisnitch < Formula
  desc "Background macOS Wi-Fi and network status agent with CLI access"
  homepage "https://github.com/gi8lino/wifi-snitch"
  url "https://github.com/gi8lino/wifi-snitch/releases/download/v0.0.37/WiFiSnitch-0.0.37.zip"
  sha256 "334cef6ba46c550e2401425846014ba3c3c60fd38c8fa93af6e3dea2d748cb3c"
  license "Apache-2.0"
  version "0.0.37"

  depends_on macos: :sonoma

  def install
    libexec.install "WiFiSnitch.app"
    bin.install "wifisnitch"

    (var/"log/wifisnitch").mkpath
  end

  service do
    run [opt_libexec/"WiFiSnitch.app/Contents/MacOS/WiFiSnitch"]
    environment_variables PATH: std_service_path_env, LANG: "en_US.UTF-8"
    keep_alive true
    process_type :interactive
    working_dir HOMEBREW_PREFIX
    log_path var/"log/wifisnitch/wifisnitch.out.log"
    error_log_path var/"log/wifisnitch/wifisnitch.err.log"
  end

  test do
    assert_match "wifisnitch", shell_output("#{bin}/wifisnitch --help 2>&1")
  end
end
