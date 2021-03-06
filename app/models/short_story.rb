class ShortStory < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  validates :short_description, presence: true

  belongs_to :user
  has_and_belongs_to_many :tags

end