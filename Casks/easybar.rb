cask "easybar" do
  version "0.10.3"
  sha256 "dc6d1a71f50b5faf3568cd6e3286714cb193a1dd2628519c4baf11c2438403a7"

  url "https://github.com/gi8lino/easybar/releases/download/v0.10.3/EasyBar-0.10.3.zip"
  name "EasyBar"
  desc "Scriptable macOS status bar with SwiftUI and Lua widgets"
  homepage "https://github.com/gi8lino/easybar"

  depends_on macos: :sonoma

  postflight do
    system "xattr -d com.apple.quarantine #{staged_path}/easybar"
    system "xattr -dr com.apple.quarantine #{appdir}/EasyBar.app"
  end

  app "EasyBar.app"
  binary "easybar"

  zap trash: [
    "~/.config/easybar",
    "~/.local/state/easybar",
  ]
end
