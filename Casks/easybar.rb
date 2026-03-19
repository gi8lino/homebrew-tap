cask "easybar" do
  version "0.0.30"
  sha256 "7279bc1ac8ecc6baa3236dba4810d3305fe38792823f78a8cf7547d8875adf3e"

  url "https://github.com/gi8lino/easybar/releases/download/v0.0.30/EasyBar-0.0.30.zip"
  name "EasyBar"
  desc "Scriptable macOS status bar with SwiftUI and Lua widgets"
  homepage "https://github.com/gi8lino/easybar"

  depends_on macos: ">= :sonoma"

  app "EasyBar.app"

  # Install the bundled CLI next to the app.
  binary "easybarctl"
end
