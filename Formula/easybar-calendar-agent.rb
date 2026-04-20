class EasybarCalendarAgent < Formula
  desc "Calendar EventKit helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.0.144/EasyBar-0.0.144.zip"
  sha256 "d19f2b94dd055ed363c39734e42d17aa21aba663e14aa8da31431b1a11a1f930"
  license "Apache-2.0"
  version "0.0.144"

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
