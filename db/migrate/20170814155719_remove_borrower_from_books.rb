# frozen_string_literal: true
class RemoveBorrowerFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :borrower_id
  end
end
