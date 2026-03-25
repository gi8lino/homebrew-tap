class EasybarNetworkAgent < Formula
  desc "Wi-Fi and network helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.0.35/EasyBar-0.0.35.zip"
  sha256 "482429e39f5431703e3149152d92f9eec3f95c0c7f15fc3d0ab3280297b527f3"
  license "Apache-2.0"
  version "0.0.35"

  depends_on macos: :sonoma

  def install
    bin.install "EasyBarNetworkAgent" => "easybar-network-agent"

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
    assert_predicate bin/"easybar-network-agent", :exist?
  end
end
