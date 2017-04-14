class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  validates :name, presence: true
  validates :happiness, presence: true
  validates :nausea, presence: true
  validates :height, presence: true
  validates :tickets, presence: true
  validates :admin, inclusion: { in: [true, false], message: "must be a boolean" }

  def mood
    if self.nausea > self.happiness
      'sad'
    else
      'happy'
    end
  end
end
