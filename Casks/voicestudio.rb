cask "voicestudio" do
  version "1.0.0"
  sha256 "ae1bf9ed1a23e7b34e7f7d7de02818f0bf6984250cb7531399841b9ecbc728b1"

  url "https://github.com/saadmsft/VoiceStudio/releases/download/v#{version}/VoiceStudio-#{version}-macOS.dmg"
  name "VoiceStudio"
  desc "Real-time broadcast voice rack for Discord, Zoom, Teams, OBS, and macOS apps"
  homepage "https://github.com/saadmsft/VoiceStudio"

  depends_on macos: :ventura

  app "VoiceStudio.app"

  zap trash: [
    "~/Library/Preferences/com.saadmahmood.voicestudio.plist",
  ]

  caveats <<~EOS
    1. Install BlackHole 2ch if you don't already have it:
         brew install --cask blackhole-2ch
    2. If macOS Gatekeeper prompts on first launch:
         xattr -cr /Applications/VoiceStudio.app
  EOS
end
