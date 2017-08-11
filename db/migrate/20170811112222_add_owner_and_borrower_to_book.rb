class AddOwnerAndBorrowerToBook < ActiveRecord::Migration[5.1]
  def change
    add_reference :books, :borrower, references: :users, index: true
    add_reference :books, :owner, references: :users, index: true

    add_foreign_key :books, :users, column: :borrower_id
    add_foreign_key :books, :users, column: :owner_id

  end
end
