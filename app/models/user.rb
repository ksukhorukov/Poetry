class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :profile_create

  has_many :poems
  has_many :short_stories
  has_one :profile

  def profile_create
    self.profile = Profile.create
  end

end