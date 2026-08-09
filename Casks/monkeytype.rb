cask "monkeytype" do
  version "0.4.3"
  sha256 "ea06054918f3b80224f4fafa808c618ec70e3a1ecb1d4c2cb08e8ce91eb0dbe7"

  url "https://github.com/sanjayb-28/monkeytype-desktop/releases/download/v#{version}/Monkeytype_#{version}_aarch64.dmg"
  name "Monkeytype"
  desc "Offline Monkeytype typing test for Apple Silicon"
  homepage "https://github.com/sanjayb-28/monkeytype-desktop"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Monkeytype.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Monkeytype.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.monkeytype.desktop",
    "~/Library/Preferences/com.monkeytype.desktop.plist",
    "~/Library/WebKit/com.monkeytype.desktop",
    "~/Library/WebKit/monkeytype",
    "~/Library/WebKit/monkeytype-mac",
  ]
end
