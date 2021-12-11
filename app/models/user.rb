# frozen_string_literal: true

##
# Models an application user.
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :lockable

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  has_many :identity_statements, dependent: :destroy

  after_create :set_default_username

  validates :username, allow_blank: true, uniqueness: true, length: { maximum: 25 }

  private

  def set_default_username
    return if update(username: "user_#{SecureRandom.random_number(100_000...999_999)}")

    set_default_username
  end
end
