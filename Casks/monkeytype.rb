cask "monkeytype" do
  version "0.1.0"
  sha256 "bc5d62cb44f06740d15017e32b9af78f4b2c82594b6cda88c1128786756cf175"

  url "https://github.com/sanjayb-28/monkeytype-desktop/releases/download/v#{version}/Monkeytype_#{version}_aarch64.dmg"
  name "Monkeytype"
  desc "Native desktop typing test app based on Monkeytype"
  homepage "https://github.com/sanjayb-28/monkeytype-desktop"

  app "Monkeytype.app"

  zap trash: [
    "~/Library/Application Support/com.monkeytype.desktop",
    "~/Library/Preferences/com.monkeytype.desktop.plist",
  ]
end
