require 'spec_helper'

describe ShortStory do

  it 'story created has belongs to user' do
    user = User.create

    user.short_stories << (story = ShortStory.create)

    expect user.short_stories.include?(story)

  end

  it 'story title success save' do
    story_params = {
        title: 'title',
        content: 'content',
        short_description: 'short_description'
    }
    story = ShortStory.new story_params

    expect story.save == true

  end

  it 'story title dont pass empty title' do
    story_params = {
        title: '',
        content: 'content',
        short_description: 'short_description'
    }
    story = ShortStory.new story_params

    expect story.save == false

  end

  it 'story title dont pass empty content' do
    story_params = {
        title: 'title',
        content: '',
        short_description: 'short_description'
    }
    story = ShortStory.new story_params

    expect story.save == false

  end

  it 'story title dont pass empty short_description' do
    story_params = {
        title: 'title',
        content: 'content',
        short_description: ''
    }
    story = ShortStory.new story_params

    expect story.save == false

  end





end
