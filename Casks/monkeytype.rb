cask "monkeytype" do
  version "0.2.0"
  sha256 "e44c9649c5644faa06a392ef0d08aa5d71fe33be07d28d3f58b956f6eea5114d"

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
