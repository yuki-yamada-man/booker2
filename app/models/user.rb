class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reverse_of_relationships,class_name:"Relationship",foreign_key:"folllowed_id",dependent: :destroy
  has_many :relationships,class_name:"Relationship",foreign_key:"follower_id",dependent: :destroy
  has_many :followers,through: :reverse_of_relationships,source: :follower
  has_many :followings,through: :relationships,source: :followed

  def follow(user_id)
    relationships.create(followed_id:user_id)
  end

  def unfollow(user_id)
    relationships.find_by(folllowed_id:user_id)
  end

  def following?(user)
    following.incrude?(user)
  end


  validates :name, presence: true, length: { minimum: 2 ,maximum: 20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

  attachment :profile_image
end

