require 'rails_helper'

RSpec.describe Book do
  describe 'validations' do
  end

  describe 'database columns' do
  	it { should have_db_column :book_uid }
  	it { should have_db_column :title }
    it { should have_db_column :author }
    it { should have_db_column :description }
    it { should have_db_column :user_id}
    it { should have_db_column :cover}
  end

  describe 'associations' do
  	it { is_expected.to belong_to :user }
    it { is_expected.to have_many :loans }
  end
end
