class RenameCommentTextColumnToComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :comment_text, :comment
  end
end