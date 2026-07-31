cask "siesta" do
  version "0.1.0"
  sha256 "0b190293ecdd2203577266e91a4f3fac507fff52ab5bcfe1ad86b0f5198cf376"

  url "https://github.com/ABGEO/siesta/releases/download/v#{version}/Siesta-#{version}.zip"
  name "Siesta"
  desc "Pause Slack status and Google Calendar availability while away"
  homepage "https://github.com/ABGEO/siesta"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "Siesta.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Siesta.app"]
  end

  zap trash: [
    "~/Library/Application Support/dev.abgeo.siesta",
    "~/Library/Preferences/dev.abgeo.siesta.plist",
  ]
end
