cask "easybar" do
  version "0.10.2"
  sha256 "ee08e399e28689de88168e423c194e64c8f36a8c09867a68aaf20b937da4d354"

  url "https://github.com/gi8lino/easybar/releases/download/v0.10.2/EasyBar-0.10.2.zip"
  name "EasyBar"
  desc "Scriptable macOS status bar with SwiftUI and Lua widgets"
  homepage "https://github.com/gi8lino/easybar"

  depends_on macos: ">= :sonoma"

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
