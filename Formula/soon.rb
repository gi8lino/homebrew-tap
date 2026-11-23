class Soon < Formula
  desc "Minimal macOS app launcher for scheduled reminders"
  homepage "https://github.com/gi8lino/soon"
  url "https://github.com/gi8lino/soon/releases/download/v0.2.10/Soon-0.2.10.zip"
  sha256 "ad6c79221bd1b7644a357f347d94565cc90c9a0c43648d6291f833289033d8c6"
  license "Apache-2.0"
  version "0.2.10"

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
