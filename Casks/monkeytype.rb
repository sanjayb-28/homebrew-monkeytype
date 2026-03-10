cask "monkeytype" do
  version "0.1.0"
  sha256 "01ab5b10ad70c7ff84e2ec3ee32fa2b2ac665f0782a0bbaa1632c71b59a7d37f"

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
