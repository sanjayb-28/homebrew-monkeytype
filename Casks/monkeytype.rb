cask "monkeytype" do
  version "0.4.7"
  sha256 "9bd07bbe55f487043082993cb93fef2dd1ed965730045ca4cf64998f83253542"

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
