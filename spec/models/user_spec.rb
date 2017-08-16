require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
  	it { is_expected.to validate_presence_of :email }
    # it { is_expected.to validate_presence_of :login }
  end

  describe 'database columns' do
  	it { should have_db_column :email }
  	it { should have_db_column :login }
  	it { should have_db_column :first_name }
  	it { should have_db_column :last_name }
  end

  describe 'associations' do
  	it { is_expected.to have_many :books }
    it { is_expected.to have_many :loans }
  end
end
