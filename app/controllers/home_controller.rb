class HomeController < ApplicationController
  def index
    @social_links = [
      {
        url: "https://github.com/nizamiza",
        label: t("github_profile"),
        icon: "github",
      },
      {
        url: "https://www.linkedin.com/in/niza-toshpulatov",
        label: t("linkedin_profile"),
        icon: "linkedin",
      },
      {
        url: "https://open.spotify.com/artist/2ddaqi6mbLWcpPKZwZvYky?si=KBbMeSMYTkWwByjGkIL1XQ",
        label: t("spotify_profile"),
        icon: "music",
      },
      {
        url: "https://www.youtube.com/channel/UCWcOtEVT1KVRPZ0j-pumVZA",
        label: t("youtube_profile"),
        icon: "youtube",
      },
    ]
  end
end
