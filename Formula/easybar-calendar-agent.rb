class EasybarCalendarAgent < Formula
  desc "Calendar EventKit helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.0.36/EasyBar-0.0.36.zip"
  sha256 "8f75e050fd53905d7251d1ce657c18482910260b851e6c4ce69502f934dc32af"
  license "Apache-2.0"
  version "0.0.36"

  depends_on macos: :sonoma

  def install
    libexec.install "EasyBarCalendarAgent.app"

    (bin/"easybar-calendar-agent").write <<~SH
      #!/bin/bash
      exec "#{libexec}/EasyBarCalendarAgent.app/Contents/MacOS/EasyBarCalendarAgent" "$@"
    SH

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
    assert_predicate libexec/"EasyBarCalendarAgent.app", :exist?
  end
end
