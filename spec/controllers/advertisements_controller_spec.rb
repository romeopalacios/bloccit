require 'rails_helper'
include RandomData
RSpec.describe AdvertisementsController, type: :controller do
  let (:my_ad) do
    Advertisement.create(
      id: 1,
      title: RandomData.random_sentence,
      copy: RandomData.random_paragraph,
      price: 99
    )
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns [my_ad] to @advertisement' do
      get :index
      expect(assigns(:advertisement)).to eq([my_ad])
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: my_ad.id }
      expect(response).to have_http_status(:success)
    end

    it 'renders the #show view' do
      get :show, params: { id: my_ad.id }
      expect(response).to render_template :show
    end

    it 'assigns my_ad to @advertisement' do
      get :show, params: { id: my_ad.id }
      expect(assigns(:advertisement)).to eq(my_ad)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders the #new view' do
      get :new
      expect(response).to render_template :new
    end

    it 'instantiates @advertisement' do
      get :new
      expect(assigns(:advertisement)).should_not be_nil
    end
  end

  describe 'POST create' do
     before { post :create, params: {advertisement: { title: RandomData.random_sentence, copy: RandomData.random_paragraph, price: 99 }} }
    it 'increases the number of advertisements by 1' do
      expect(Advertisement.count).to eq 1
    end

    it 'assigns the new advertisement to @advertisements' do
      expect(assigns(:advertisement)).to eq Advertisement.last
    end

    it 'redirects to the new advertisements' do
      expect(assigns(:advertisement)).to eq Advertisement.last
    end
  end
end
