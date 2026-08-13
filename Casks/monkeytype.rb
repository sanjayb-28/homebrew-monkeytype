cask "monkeytype" do
  version "0.1.1"
  sha256 "716f74c0aa7db8ace1e8abed48058778e44fd7be3a63d2fd897ec3e7086aaaa1"

  url "https://github.com/sanjayb-28/monkeytype/releases/download/desktop-v#{version}/Monkeytype-#{version}-arm64.dmg"
  name "Monkeytype"
  desc "Offline Monkeytype typing test for Apple Silicon"
  homepage "https://github.com/sanjayb-28/monkeytype"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Monkeytype.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Monkeytype.app"],
                   sudo: false
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
