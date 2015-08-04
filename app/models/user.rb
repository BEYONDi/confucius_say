class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chats, :foreign_key => :sender_id

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true


  # devise :database_authenticatable, :registerable, :recoverable, :trackable, :validatable

   def name
     [first_name, last_name].join(' ')
   end

end
