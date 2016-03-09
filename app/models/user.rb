class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true

  has_attached_file :avatar, style: { medium: '300x300#', thmb: '100x100#'}
  validates_attachment_content_type :avatar, content_type: ['image/jpg', 'image/jpeg', 'image/png']
  has_many :prototypes
end
