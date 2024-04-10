class HomeController < ApplicationController
  def index
    @social_links = [
      {
        url: "https://github.com/nizamiza",
        type: "github",
      },
      {
        url: "https://www.linkedin.com/in/niza-toshpulatov",
        type: "linkedin",
      },
      {
        url: "https://open.spotify.com/artist/2ddaqi6mbLWcpPKZwZvYky?si=KBbMeSMYTkWwByjGkIL1XQ",
        type: "spotify",
      },
      {
        url: "https://www.youtube.com/channel/UCWcOtEVT1KVRPZ0j-pumVZA",
        type: "youtube",
      },
    ]
  end
end
