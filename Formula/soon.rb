class Soon < Formula
  desc "Minimal macOS app launcher for scheduled reminders"
  homepage "https://github.com/gi8lino/soon"
  url "https://github.com/gi8lino/soon/releases/download/v0.0.9/Soon-0.0.9.zip"
  sha256 "cb0102738ddeca8abc844611229a30500b39dff0c2122e95052092b5bc37ea00"
  license "Apache-2.0"
  version "0.0.9"

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
