require 'spec_helper'

describe User do

  it 'profile have to create after user create' do

    user = User.create

    expect user.profile.present?

  end



end
