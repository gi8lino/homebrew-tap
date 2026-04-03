class EasybarNetworkAgent < Formula
  desc "Wi-Fi and network helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.0.75/EasyBar-0.0.75.zip"
  sha256 "5e806fef9f3ffc091ae2882787bdd1de0f7ca6960d48e7af75a34cd0d28c458b"
  license "Apache-2.0"
  version "0.0.75"

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
