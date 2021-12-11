# frozen_string_literal: true

##
# Models a user profile.
class Profile < ApplicationRecord
  belongs_to :user

  after_create :set_default_username

  validates :first_name, presence: true, length: { maximum: 40 }
  validates :last_name, presence: true, length: { maximum: 40 }

  def name?
    first_name && last_name
  end

  private

  def set_default_username
    user.update(username: "#{first_name}#{last_name}_#{SecureRandom.random_number(10_000...99_999)}")
  end
end
