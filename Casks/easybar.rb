cask "easybar" do
  version "0.0.28"
  sha256 "785e0bf34d439d47ffb4a17874771fad762739db706ac450da448f3586101146"

  url "https://github.com/gi8lino/easybar/releases/download/v0.0.28/EasyBar-0.0.28.zip"
  name "EasyBar"
  desc "Scriptable macOS status bar with SwiftUI and Lua widgets"
  homepage "https://github.com/gi8lino/easybar"

  depends_on macos: ">= :sonoma"

  app "EasyBar.app"

  # Install the bundled CLI next to the app.
  binary "easybarctl"
end
