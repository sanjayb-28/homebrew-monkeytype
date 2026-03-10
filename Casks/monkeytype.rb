cask "monkeytype" do
  version "0.1.0"
  sha256 "516e72d52889debe0b846f67c132f9933bd3186db8e35f13e2ff403c7be5e67d"

  url "https://github.com/sanjayb-28/monkeytype-desktop/releases/download/v#{version}/Monkeytype_#{version}_aarch64.dmg"
  name "Monkeytype"
  desc "Native desktop typing test app based on Monkeytype"
  homepage "https://github.com/sanjayb-28/monkeytype-desktop"

  app "Monkeytype.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Monkeytype.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.monkeytype.desktop",
    "~/Library/Preferences/com.monkeytype.desktop.plist",
  ]
end
