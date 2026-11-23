class Wifisnitch < Formula
  desc "Background macOS Wi-Fi and network status agent with CLI access"
  homepage "https://github.com/gi8lino/wifi-snitch"
  url "https://github.com/gi8lino/wifi-snitch/releases/download/v0.2.7/WiFiSnitch-0.2.7.zip"
  sha256 "af020945ad547b4af5154afc73c09cc3ebafedab500aadf3732e434f2105b6db"
  license "Apache-2.0"
  version "0.2.7"

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
