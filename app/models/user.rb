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

  # TODO NB: This does not work with devise's current_user this way...
  # scope :free_user, -> { where(admin: :false, premium: :false) }
  # scope :premium_user, -> { where(admin: :false, premium: :true) }

  def name
    [first_name, last_name].join(' ')
  end

end
