module ApplicationHelper
  require "redcarpet"

  def content_for_head_once(id, &block)
    @included_blocks ||= []

    unless @included_blocks.include?(id)
      @included_blocks << id
      content_for(:head, &block)
    end
  end

  def render_markdown(&block)
    @markdown_renderer ||= Redcarpet::Render::HTML.new(
      autolink: true,
      tables: true,
      with_toc_data: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true,
    )

    @markdown ||= Redcarpet::Markdown.new(@markdown_renderer)

    content = strip_indent(capture(&block))
    @markdown.render(content).html_safe
  end

  def strip_indent(content)
    # Find the common leading whitespace in the content
    indentation = content.scan(/^[ 	]+/).min_by(&:length)

    # Remove the common leading whitespace from each line
    content.gsub(/^#{indentation}/, "")
  end

  def localize_path(path: request.path, locale: I18n.locale)
    is_default_locale = locale == I18n.default_locale

    delocalized_path = path.gsub(
      /^\/(#{I18n.available_locales.join("|")})\/?/, "/"
    )

    resolved_path = delocalized_path == "home" ? "/" : delocalized_path
    final_path = resolved_path.start_with?("/") ? resolved_path : "/#{resolved_path}"

    if is_default_locale
      final_path
    else
      "/#{locale}#{final_path}"
    end
  end
end
