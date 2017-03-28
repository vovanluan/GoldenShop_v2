require 'rails_helper'

describe BooksController do
  let(:book) { FactoryGirl.create :book }
  describe "GET #index" do
    before { get :index }

    it { should render_template('index') }
    it { should respond_with(200) }
  end

  describe "GET #new" do
    before { get :new }
    it { should render_template('new') }
    it { should respond_with(200) }
  end

  describe "POST #create" do
    let!(:params) { { book: FactoryGirl.attributes_for(:book) } }
    it "create new book" do
      post :create, params
      expect(Book.count).to eq(1)
    end
  end
end
