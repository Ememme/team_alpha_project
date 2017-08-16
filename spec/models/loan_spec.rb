# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Loan do
  describe 'validations' do
  end

  describe 'database columns' do
  	it { should have_db_column :book_id }
    it { should have_db_column :user_id}
    it { should have_db_column :status}
  end

  describe 'associations' do
  	it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :book }
  end
end
