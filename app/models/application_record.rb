# frozen_string_literal: true

##
# Base record model class.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
