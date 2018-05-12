class User < ActiveRecord::Base
  has_many :microposts, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  def feed
    Micropost.where("user_id = ?", id)
  end

  def feed
    Micropost.from_users_followed_by(self)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name,  presence: true, length: { maximum: 50 }
end
