require 'spec_helper'

describe HomesController do

  it 'has to responce 200 ok' do
    get 'index'
    expect(response.status).to eq(200)
  end

end