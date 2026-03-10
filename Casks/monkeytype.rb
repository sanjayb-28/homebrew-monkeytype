cask "monkeytype" do
  version "0.1.0"
  sha256 "0ad35f9bd57e2ca5d5fefa0e98a1dae56c3c66080815700b931c3e066e079c3f"

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
