require 'spec_helper'

describe ProfilesController do


  it 'go to auth check' do
    get :show

    expect(response.status).to eq(302)
  end

end

