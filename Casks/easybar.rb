cask "easybar" do
  version "0.21.0"
  sha256 "1afa2c0d6e43123dfae288904b82d3ec5919a03bb5dfd238d160c585599bfe7d"

  url "https://github.com/gi8lino/easybar/releases/download/v0.21.0/EasyBar-0.21.0.zip"
  name "EasyBar"
  desc "Scriptable macOS status bar with SwiftUI and Lua widgets"
  homepage "https://github.com/gi8lino/easybar"

  depends_on formula: [
    "easybar-calendar-agent",
    "easybar-network-agent",
    "lua",
  ]
  depends_on macos: :sonoma

  postflight do
    system "xattr", "-d", "com.apple.quarantine", "#{staged_path}/easybar"
    system "xattr", "-dr", "com.apple.quarantine", "#{appdir}/EasyBar.app"
    system "#{HOMEBREW_PREFIX}/bin/brew", "services", "restart", "easybar-calendar-agent"
    system "#{HOMEBREW_PREFIX}/bin/brew", "services", "restart", "easybar-network-agent"
  end

  uninstall_preflight do
    system "#{HOMEBREW_PREFIX}/bin/brew", "services", "stop", "easybar-calendar-agent"
    system "#{HOMEBREW_PREFIX}/bin/brew", "services", "stop", "easybar-network-agent"
  end

  app "EasyBar.app"
  binary "easybar"

  zap trash: [
    "~/.config/easybar",
    "~/.local/state/easybar",
  ]
end
