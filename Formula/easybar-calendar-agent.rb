class EasybarCalendarAgent < Formula
  desc "Calendar EventKit helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.0.33/EasyBar-0.0.33.zip"
  sha256 "81656071c73830c1c25c4dd3c1a934092d45764e258942b31b5c69126c753420"
  license "Apache-2.0"
  version "0.0.33"

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
