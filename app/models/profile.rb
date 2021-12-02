# frozen_string_literal: true

##
# Models a user profile.
class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true, length: { maximum: 40 }
  validates :last_name, presence: true, length: { maximum: 40 }

  def name?
    first_name && last_name
  end
end
