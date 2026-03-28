class EasybarCalendarAgent < Formula
  desc "Calendar EventKit helper service for EasyBar"
  homepage "https://github.com/gi8lino/easybar"
  url "https://github.com/gi8lino/easybar/releases/download/v0.0.55/EasyBar-0.0.55.zip"
  sha256 "82721db8ed3da162ad69f58b090cb0dd26092436dd34fdd6c6e0225249dc063b"
  license "Apache-2.0"
  version "0.0.55"

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
