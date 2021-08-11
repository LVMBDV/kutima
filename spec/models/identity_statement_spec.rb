# frozen_string_literal: true

require 'rails_helper'

describe IdentityStatement, type: :model do
  subject(:identity_statement) { described_class.new }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_db_index(:life_area) }

  it { is_expected.to validate_presence_of(:identity) }
  it { is_expected.to validate_length_of(:identity).is_at_least(3).is_at_most(45) }

  it { is_expected.to validate_presence_of(:objective) }
  it { is_expected.to validate_length_of(:objective).is_at_least(3).is_at_most(255) }

  it do
    expect(identity_statement).to define_enum_for(:life_area).with_values(LifeArea::AREAS)
                                                             .backed_by_column_of_type(:enum)
                                                             .with_suffix(:life_area)
  end
end
