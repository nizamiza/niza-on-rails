class DemoController < ApplicationController
  def index
    @default_tab_defs = [
      get_tab_def("result"),
      get_tab_def("html"),
      get_tab_def("css"),
      get_tab_def("js")
    ]

    @demos = [
      create_demo("text_decoration_hamburger_menu"),
      create_demo("nz_counter", [
        get_tab_def("result"),
        get_tab_def("html"),
      ])
    ]
  end

  def get_tab_def(key)
    case key
    when "result" then ["Result", ""]
    when "html" then ["HTML", "xml"]
    when "css" then ["CSS", "css"]
    when "js" then ["JS", "javascript"]
    else
      raise "Unknown tab definition key: #{key}"
    end
  end

  def create_tab(id, label, selected = false)
    label_text, lang = label

    downcased_label = label_text.downcase
    composed_id = "#{id}-#{downcased_label}"

    {
      id: composed_id,
      label: label_text,
      lang: lang,
      key: downcased_label,
      selected: selected
    }
  end

  def create_demo(id, tab_defs = nil)
    tab_defs ||= @default_tab_defs

    { 
      id: id,
      tabs: tab_defs.map.with_index { |label, index|
        create_tab(id, label, index == 0)
      }
    }
  end
end
