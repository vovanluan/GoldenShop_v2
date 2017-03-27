require 'rails_helper'

describe BooksController do
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
    before { post :create }
    it "create new book" do
      post :create, book_params: FactoryGirl.attributes_for(:book)
    end
  end
end
