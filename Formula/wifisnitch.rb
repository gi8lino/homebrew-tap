class Wifisnitch < Formula
  desc "Background macOS Wi-Fi and network status agent with CLI access"
  homepage "https://github.com/gi8lino/wifi-snitch"
  url "https://github.com/gi8lino/wifi-snitch/releases/download/v0.0.10/WiFiSnitch-0.0.10.zip"
  sha256 "3ff215da96bb20a75646dd67447cd64fc1d6ea16b6c18aba84af231209037c44"
  license "Apache-2.0"
  version "0.0.10"

  depends_on macos: :sonoma

  def install
    libexec.install "WiFiSnitch.app"
    bin.install "wifisnitchctl"

    (bin/"wifisnitch").write <<~SH
      #!/bin/bash
      exec "#{libexec}/WiFiSnitch.app/Contents/MacOS/WiFiSnitch" "$@"
    SH

    (var/"log/wifisnitch").mkpath
  end

  service do
    run [opt_bin/"wifisnitch"]
    environment_variables PATH: std_service_path_env, LANG: "en_US.UTF-8"
    keep_alive true
    process_type :interactive
    working_dir HOMEBREW_PREFIX
    log_path var/"log/wifisnitch/wifisnitch.out.log"
    error_log_path var/"log/wifisnitch/wifisnitch.err.log"
  end

  test do
    assert_match "wifisnitchctl", shell_output("#{bin}/wifisnitchctl --help 2>&1")
  end
end
