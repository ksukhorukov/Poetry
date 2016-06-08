require 'spec_helper'

describe Poem do

  it 'poem removes after changing' do
    poem = Poem.create
    Tag.create([{name: '1'}, {name: '2'}, {name: '3'}])

    poem.tags << Tag.find_by_name('3')
    poem.tags = Tag.where('(name = ?) OR (name = ?)', '1', '2')

    expect (poem.tags.pluck(:name).include?('1') == true && poem.tags.pluck(:name).include?('2') == true && poem.tags.pluck(:name).include?('3') == false)


  end

end
