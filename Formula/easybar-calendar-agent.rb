class EasybarCalendarAgent < Formula
  desc "Calendar EventKit helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.2.16/EasyBar-0.2.16.zip"
  sha256 "476eac57ec9c341c2b95882ead59bd0497c7d3a0b102be54859e8a262993f95f"
  license "Apache-2.0"
  version "0.2.16"

  depends_on macos: :sonoma

  def install
    libexec.install "EasyBarCalendarAgent.app"

    (var/"log/easybar-calendar-agent").mkpath
  end

  service do
    run [opt_libexec/"EasyBarCalendarAgent.app/Contents/MacOS/EasyBarCalendarAgent"]
    environment_variables PATH: std_service_path_env, LANG: "en_US.UTF-8"
    keep_alive true
    process_type :interactive
    working_dir HOMEBREW_PREFIX
    log_path var/"log/easybar-calendar-agent/easybar-calendar-agent.out.log"
    error_log_path var/"log/easybar-calendar-agent/easybar-calendar-agent.err.log"
  end

  test do
    assert_predicate libexec/"EasyBarCalendarAgent.app", :exist?
  end
end
