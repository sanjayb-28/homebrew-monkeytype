cask "monkeytype" do
  version "0.4.4"
  sha256 "ba53c0d959b6dd461f67bdf78a664e94d3d6c02c69771091e0d33714a6bbda18"

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
