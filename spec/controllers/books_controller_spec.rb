require 'rails_helper'

RSpec.describe(BooksController, type: :controller) do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
=begin
  describe 'GET #show' do
    let!(:book) { create(:book) }

    it 'returns http success' do
      get :show, params: { id: book.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #create' do
    let!(:book) { create(:book) }

    let(:book) { FactoryGirl.attributes_for(:book) }

    it 'returns http success' do
      get :create, params: { book: book }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    let!(:book) { create(:book) }

    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #delete' do
  end
=end
end
