class EasybarCalendarAgent < Formula
  desc "Calendar EventKit helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.25.6/EasyBarCalendarAgent-0.25.6.zip"
  sha256 "bc13b437b9538cda5df9d89f45da49eb1cd12a9fe827a9da17817b408051e332"
  license "Apache-2.0"
  version "0.25.6"

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
