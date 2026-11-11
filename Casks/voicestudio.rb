cask "voicestudio" do
  version "1.0.0"
  sha256 "ae1bf9ed1a23e7b34e7f7d7de02818f0bf6984250cb7531399841b9ecbc728b1"

  url "https://github.com/saadmsft/VoiceStudio/releases/download/v#{version}/VoiceStudio-#{version}-macOS.dmg"
  name "VoiceStudio"
  desc "Real-time broadcast voice rack for Discord, Zoom, Teams, OBS, and macOS apps"
  homepage "https://github.com/saadmsft/VoiceStudio"

  depends_on macos: ">= :ventura"

  app "VoiceStudio.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/VoiceStudio.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.saadmahmood.voicestudio.plist",
  ]

  caveats <<~EOS
    To route VoiceStudio into Discord, Zoom, Teams, Slack, Meet, or OBS,
    install BlackHole 2ch if you don't already have it:
      brew install --cask blackhole-2ch
  EOS
end
