class DemoController < ApplicationController
  def index
    @default_tab_defs = [
      ["Result", ""],
      ["HTML", "xml"],
      ["CSS", "css"],
      ["JS", "javascript"]
    ]

    @demos = [
      create_demo("text_decoration_hamburger_menu"),
      create_demo("nz_counter", [
        ["Result", ""],
        ["HTML", "xml"]
      ])
    ]
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
