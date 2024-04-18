class RenameAccessTokenTypeToKind < ActiveRecord::Migration[7.1]
  def change
    rename_column :access_tokens, :type, :kind
  end
end
