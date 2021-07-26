# frozen_string_literal: true

##
# Base helper class.
module ApplicationHelper
  def link_from_config(path)
    send(path.to_sym)
  rescue NoMethodError
    path
  end
end
