class EasybarNetworkAgent < Formula
  desc "Wi-Fi and network helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.0.65/EasyBar-0.0.65.zip"
  sha256 "d18cdde8df4067b73716972fa519a6bedb77d61f22285866dd0839dac0e1170c"
  license "Apache-2.0"
  version "0.0.65"

  depends_on macos: :sonoma

  def install
    libexec.install "EasyBarNetworkAgent.app"

    (bin/"easybar-network-agent").write <<~SH
      #!/bin/bash
      exec "#{libexec}/EasyBarNetworkAgent.app/Contents/MacOS/EasyBarNetworkAgent" "$@"
    SH

    (var/"log/easybar-network-agent").mkpath
  end

  service do
    run [opt_bin/"easybar-network-agent"]
    environment_variables PATH: std_service_path_env, LANG: "en_US.UTF-8"
    keep_alive true
    process_type :interactive
    working_dir HOMEBREW_PREFIX
    log_path var/"log/easybar-network-agent/easybar-network-agent.out.log"
    error_log_path var/"log/easybar-network-agent/easybar-network-agent.err.log"
  end

  test do
    assert_predicate libexec/"EasyBarNetworkAgent.app", :exist?
  end
end
