class EasybarNetworkAgent < Formula
  desc "Wi-Fi and network helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.25.3/EasyBarNetworkAgent-0.25.3.zip"
  sha256 "c39a5c6a2dd107c701d4089039bb6a700bac4da19e4631f4cd1faf083e120499"
  license "Apache-2.0"
  version "0.25.3"

  depends_on macos: :sonoma

  def install
    libexec.install "EasyBarNetworkAgent.app"
    system "xattr", "-dr", "com.apple.quarantine", libexec/"EasyBarNetworkAgent.app"
    (var/"log/easybar").mkpath
  end

  service do
    run [opt_libexec/"EasyBarNetworkAgent.app/Contents/MacOS/EasyBarNetworkAgent"]
    environment_variables PATH: std_service_path_env, LANG: "en_US.UTF-8"
    keep_alive successful_exit: false
    process_type :interactive
    working_dir HOMEBREW_PREFIX
    log_path var/"log/easybar/network-agent.out.log"
    error_log_path var/"log/easybar/network-agent.err.log"
  end

  test do
    assert_predicate libexec/"EasyBarNetworkAgent.app", :exist?
  end
end
