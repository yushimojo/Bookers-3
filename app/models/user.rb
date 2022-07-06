class User < ApplicationRecord
  
  has_one_attached :profile_image
  validates :introduction, length: {maximum: 50}
  validates :name, presence: true,length: { in: 2..20 },uniqueness: true
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
   has_many :books,dependent: :destroy 

  
  
  
  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end
