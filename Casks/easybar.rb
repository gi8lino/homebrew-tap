cask "easybar" do
  version "0.0.27"
  sha256 "d9bc0a5159b183a6939883a508e0c0eadebdac4aef3e1d769c76757f710c40bb"

  url "https://github.com/gi8lino/easybar/releases/download/v0.0.27/EasyBar-0.0.27.zip"
  name "EasyBar"
  desc "Scriptable macOS status bar with SwiftUI and Lua widgets"
  homepage "https://github.com/gi8lino/easybar"

  depends_on macos: ">= :sonoma"

  app "EasyBar.app"

  # Install the bundled CLI next to the app.
  binary "easybarctl"
end
