# frozen_string_literal: true

##
# Models an application user.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :lockable
  has_one :profile, dependent: :destroy
  has_many :identity_statements, dependent: :destroy
end
