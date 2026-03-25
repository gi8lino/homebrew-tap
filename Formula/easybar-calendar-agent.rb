class EasybarCalendarAgent < Formula
  desc "Calendar EventKit helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.0.34/EasyBar-0.0.34.zip"
  sha256 "a819a8a311460d231cca2436d2fb826d29eabb63b557b52b7251c9b6fee81744"
  license "Apache-2.0"
  version "0.0.34"

  depends_on macos: :sonoma

  def install
    bin.install "EasyBarCalendarAgent" => "easybar-calendar-agent"

    (var/"log/easybar-calendar-agent").mkpath
  end

  service do
    run [opt_bin/"easybar-calendar-agent"]
    environment_variables PATH: std_service_path_env, LANG: "en_US.UTF-8"
    keep_alive true
    process_type :interactive
    working_dir HOMEBREW_PREFIX
    log_path var/"log/easybar-calendar-agent/easybar-calendar-agent.out.log"
    error_log_path var/"log/easybar-calendar-agent/easybar-calendar-agent.err.log"
  end

  test do
    assert_predicate bin/"easybar-calendar-agent", :exist?
  end
end
