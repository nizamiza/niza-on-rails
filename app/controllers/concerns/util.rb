module Util
  extend ActiveSupport::Concern

  def add_tab_search_param(tab_id)
    params.merge(tab: tab_id)
  end
end
