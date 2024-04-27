class ProjectsController < ApplicationController
  def index
    @projects = [
      {
        title: "Using PocketBase, Deno, and Fresh to deploy a production ready app under an hour",
        repo_url: "https://github.com/nizamiza/noc-pb-deno-fresh-workshop",
        cover_image_path: view_context.image_path("projects/noc-workshop.jpeg"),
      },
      {
        title: "ZodEnv - Zod powered environment variable parser",
        repo_url: "https://github.com/nizamiza/zodenv",
        cover_image_path: view_context.image_path("projects/zodenv.jpeg"),
      },
      {
        title: "RPM - A rudimentary plugin manager for NeoVim",
        repo_url: "https://github.com/nizamiza/rpm",
        cover_image_path: view_context.image_path("projects/rpm.jpeg"),
      },
    ]
  end
end
