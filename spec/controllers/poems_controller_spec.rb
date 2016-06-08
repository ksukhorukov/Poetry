require 'spec_helper'

describe PoemsController do


  it 'have to be access for everyone' do
    get :index

    expect(response.status).to eq(200)
  end

end

