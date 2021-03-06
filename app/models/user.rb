class User < ActiveRecord::Base

  has_many :votes
  has_many :questions

  validates :first_name, :last_name, :user_name, :email, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  has_secure_password

  def can_vote?(question_id)
    Vote.where(question_id: question_id).where(user_id: id).count == 0
  end

end