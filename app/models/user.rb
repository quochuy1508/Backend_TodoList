class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true, length: { maximum: 255 },
            format:     { with: VALID_EMAIL_REGEX }, uniqueness: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :todos, foreign_key: :created_by, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_and_belongs_to_many :conversations, dependent: :destroy
end
