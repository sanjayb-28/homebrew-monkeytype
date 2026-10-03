cask "monkeytype" do
  version "0.3.0"
  sha256 "1859c4a40c46365d68587eed2a1e069961949d1cc7bc8ef099018841046aef13"

  url "https://github.com/sanjayb-28/monkeytype/releases/download/desktop-v#{version}/Monkeytype-#{version}-arm64.dmg"
  name "Monkeytype"
  desc "Offline Monkeytype typing test for Apple Silicon"
  homepage "https://github.com/sanjayb-28/monkeytype"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Monkeytype.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Monkeytype.app"]
  end

  zap trash: [
    "~/Library/Application Support/@monkeytype/desktop",
    "~/Library/Application Support/com.monkeytype.desktop",
    "~/Library/Preferences/com.monkeytype.desktop.plist",
    "~/Library/WebKit/com.monkeytype.desktop",
    "~/Library/WebKit/monkeytype",
    "~/Library/WebKit/monkeytype-mac",
  ]
end
