class Soon < Formula
  desc "Minimal macOS app launcher for scheduled reminders"
  homepage "https://github.com/gi8lino/soon"
  url "https://github.com/gi8lino/soon/releases/download/v0.0.33/Soon-0.0.33.zip"
  sha256 "17beaabdc9be4479c7f59694b3a8918394439a4da6380a6446b72ca2c7891b94"
  license "Apache-2.0"
  version "0.0.33"

  depends_on macos: :sonoma

  def install
    libexec.install "Soon.app"

    (var/"log/soon").mkpath
  end

  service do
    run [opt_libexec/"Soon.app/Contents/MacOS/Soon"]
    environment_variables PATH: std_service_path_env, LANG: "en_US.UTF-8"
    keep_alive true
    process_type :interactive
    working_dir HOMEBREW_PREFIX
    log_path var/"log/soon/soon.out.log"
    error_log_path var/"log/soon/soon.err.log"
  end

  test do
    assert_predicate libexec/"Soon.app", :exist?
  end
end
