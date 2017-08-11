require 'rails_helper'

RSpec.describe Book do
  describe 'validations' do
  end

  describe 'database columns' do
  	it { should have_db_column :book_uid }
  	it { should have_db_column :owner_id }
  	it { should have_db_column :borrower_id }
  	it { should have_db_column :title }
    it { should have_db_column :author }
    it { should have_db_column :description }
  end
end