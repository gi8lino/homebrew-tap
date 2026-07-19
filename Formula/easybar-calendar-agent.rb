class EasybarCalendarAgent < Formula
  desc "Calendar EventKit helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.15.4/EasyBarCalendarAgent-0.15.4.zip"
  sha256 "cd50f378e965ad71898a4e041fdcdff7ecd5cb2aa54d5402ebb9aede2c277fbc"
  license "Apache-2.0"
  version "0.15.4"

  depends_on macos: :sonoma

  def install
    libexec.install "EasyBarCalendarAgent.app"
    system "xattr", "-dr", "com.apple.quarantine", libexec/"EasyBarCalendarAgent.app"
    (var/"log/easybar").mkpath
  end

  service do
    run [opt_libexec/"EasyBarCalendarAgent.app/Contents/MacOS/EasyBarCalendarAgent"]
    environment_variables PATH: std_service_path_env, LANG: "en_US.UTF-8"
    keep_alive successful_exit: false
    process_type :interactive
    working_dir HOMEBREW_PREFIX
    log_path var/"log/easybar/calendar-agent.out.log"
    error_log_path var/"log/easybar/calendar-agent.err.log"
  end

  test do
    assert_predicate libexec/"EasyBarCalendarAgent.app", :exist?
  end
end
