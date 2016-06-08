class CreatePoemsStoriesTags < ActiveRecord::Migration
  def change
    create_table :poems do |t|

      t.string :title
      t.string :content
      t.string :metaphor
      t.belongs_to :user

      t.timestamps

    end

    create_table :short_stories do |t|

      t.string :title
      t.string :content
      t.string :short_description
      t.belongs_to :user

      t.timestamps

    end

    create_table :tags do |t|

      t.string :name

      t.timestamps

    end

    create_table :poems_tags do |t|

      t.belongs_to :poem, index: true
      t.belongs_to :tag, index: true

    end

    create_table :short_stories_tags do |t|

      t.belongs_to :short_story, index: true
      t.belongs_to :tag, index: true

    end





  end
end
