cask "easybar" do
  version "0.1.0"
  sha256 "REPLACE_WITH_SHA256_OF_EasyBar-0.1.0.zip"

  url "https://github.com/gi8lino/easybar/releases/download/v#{version}/EasyBar-#{version}.zip"
  name "EasyBar"
  desc "Scriptable macOS status bar with SwiftUI and Lua widgets"
  homepage "https://github.com/gi8lino/easybar"

  depends_on macos: ">= :sonoma"

  app "EasyBar.app"
  binary "#{appdir}/EasyBar.app/Contents/MacOS/easybar", target: "easybar"

  zap trash: [
    "~/Library/Logs/EasyBar.log",
  ]
end
