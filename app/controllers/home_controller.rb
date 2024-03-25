class HomeController < ApplicationController
  def index
    @social_links = [
      {
        url: "https://github.com/nizamiza",
        label: "My GitHub profile",
        icon: "github",
      },
      {
        url: "https://www.linkedin.com/in/niza-toshpulatov-27223b233",
        label: "My LinkedIn profile",
        icon: "linkedin",
      },
      {
        url: "https://open.spotify.com/artist/2ddaqi6mbLWcpPKZwZvYky?si=KBbMeSMYTkWwByjGkIL1XQ",
        label: "My Spotify profile",
        icon: "music",
      },
      {
        url: "https://www.youtube.com/channel/UCWcOtEVT1KVRPZ0j-pumVZA",
        label: "My YouTube channel",
        icon: "youtube",
      },
    ]
  end
end
