class Wifisnitch < Formula
  desc "Background macOS Wi-Fi and network status agent with CLI access"
  homepage "https://github.com/gi8lino/wifi-snitch"
  url "https://github.com/gi8lino/wifi-snitch/releases/download/v0.0.32/WiFiSnitch-0.0.32.zip"
  sha256 "6b384cd8dda3ab5f72f3b798ecb553b25a83fd85bef9d01c0ea950d7c1ffd0b4"
  license "Apache-2.0"
  version "0.0.32"

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
