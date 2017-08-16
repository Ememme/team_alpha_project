# frozen_string_literal: true
class RenameOwnerIdToUserId < ActiveRecord::Migration[5.1]
  def change
  	rename_column :books, :owner_id, :user_id
  end
end
