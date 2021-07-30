# frozen_string_literal: true

require 'rails_helper'

describe Profile, type: :model do
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_length_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_length_of(:last_name) }
end
