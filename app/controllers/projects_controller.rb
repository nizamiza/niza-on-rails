class ProjectsController < ApplicationController
  def index
    @projects = [
      {
        title: "Lo-cal - Simple calendar that stores everything locally",
        repo_url: "https://github.com/nizamiza/lo-cal",
        cover_image_path: view_context.image_path("projects/lo-cal.webp"),
      },
      {
        title: "PocketBase, Deno, Fresh Workshop",
        repo_url: "https://github.com/nizamiza/noc-pb-deno-fresh-workshop",
        cover_image_path: view_context.image_path("projects/noc-workshop.webp"),
      },
      {
        title: "Niza on Rails - This very website!",
        repo_url: "https://github.com/nizamiza/niza-on-rails",
        cover_image_path: view_context.image_path("projects/niza-on-rails.webp"),
      },
      {
        title: "ZodEnv - Zod powered ENV file parser",
        repo_url: "https://github.com/nizamiza/zodenv",
        cover_image_path: view_context.image_path("projects/zodenv.webp"),
      },
      {
        title: "RPM - A rudimentary plugin manager for NeoVim",
        repo_url: "https://github.com/nizamiza/rpm",
        cover_image_path: view_context.image_path("projects/rpm.webp"),
      },
    ]
  end
end
