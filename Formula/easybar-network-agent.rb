class EasybarNetworkAgent < Formula
  desc "Wi-Fi and network helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.0.42/EasyBar-0.0.42.zip"
  sha256 "eaa5e32c495ab352efb20f295c84c07960b6acb2d4d9ee91ac2181c27dbf8581"
  license "Apache-2.0"
  version "0.0.42"

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
