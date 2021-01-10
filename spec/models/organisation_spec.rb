require 'rails_helper'

RSpec.describe Organisation, type: :model do
  it { is_expected.to have_many(:users) }
  it { is_expected.to have_many(:sites) }
end
