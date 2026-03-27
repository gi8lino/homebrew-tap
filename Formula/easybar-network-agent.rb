class EasybarNetworkAgent < Formula
  desc "Wi-Fi and network helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.0.53/EasyBar-0.0.53.zip"
  sha256 "8df342cab02696b4e576c85f65038f9be74e02d802645b3ded630adbde5b429c"
  license "Apache-2.0"
  version "0.0.53"

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
