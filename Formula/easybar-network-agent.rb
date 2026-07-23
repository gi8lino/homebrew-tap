class EasybarNetworkAgent < Formula
  desc "Wi-Fi and network helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.25.4/EasyBarNetworkAgent-0.25.4.zip"
  sha256 "acfe7d2b1c072cf21a436307b7fe9343658b58ac8458b5c8de9843b83b11a6eb"
  license "Apache-2.0"
  version "0.25.4"

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
