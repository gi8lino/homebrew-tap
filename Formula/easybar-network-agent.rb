class EasybarNetworkAgent < Formula
  desc "Wi-Fi and network helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.0.125/EasyBar-0.0.125.zip"
  sha256 "d5cd65c5426e6c8c0c15409bf68a62002eae620daa865301afbb5feb1cf02e77"
  license "Apache-2.0"
  version "0.0.125"

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
