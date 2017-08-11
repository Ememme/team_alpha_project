require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
  	it { is_expected.to validate_presence_of :title }
  	it { is_expected.to validate_presence_of :author }
  end

  describe 'database columns' do
  	it { should have_db_column :book_unique_id }
  	it { should have_db_column :owner_id }
  	it { should have_db_column :current_borrower_id }
  	it { should have_db_column :title }
    it { should have_db_column :author }
  end
end