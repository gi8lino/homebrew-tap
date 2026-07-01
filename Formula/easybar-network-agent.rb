class EasybarNetworkAgent < Formula
  desc "Wi-Fi and network helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.4.0/EasyBar-0.4.0.zip"
  sha256 "3e0e23aa7af7078187d5a651b734994df667206b06ca7eaee0b02ec99e89044a"
  license "Apache-2.0"
  version "0.4.0"

  depends_on macos: :sonoma

  def install
    libexec.install "EasyBarNetworkAgent.app"

    (var/"log/easybar-network-agent").mkpath
  end

  service do
    run [opt_libexec/"EasyBarNetworkAgent.app/Contents/MacOS/EasyBarNetworkAgent"]
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
