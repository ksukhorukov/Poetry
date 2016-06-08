require 'spec_helper'

describe Poem do

  it 'poem created has belongs to user' do
    user = User.create

    user.poems << (poem = Poem.create)

    expect user.poems.include?(poem)

  end

  it 'poem success save' do
    poem_params = {
        title: 'title',
        content: 'content',
        metaphor: 'metaphor'
    }
    poem =  Poem.new poem_params

    expect poem.save == true

  end

  it 'poem dont pass empty title' do
    poem_params = {
        title: '',
        content: 'content',
        metaphor: 'metaphor'
    }
    poem =  Poem.new poem_params

    expect poem.save == false

  end

  it 'poem dont pass empty content' do
    poem_params = {
        title: 'title',
        content: '',
        metaphor: 'metaphor'
    }
    poem =  Poem.new poem_params

    expect poem.save == false

  end

  it 'poem dont pass empty metaphor' do
    poem_params = {
        title: 'title',
        content: 'content',
        metaphor: ''
    }
    poem =  Poem.new poem_params

    expect poem.save == false

  end





end
