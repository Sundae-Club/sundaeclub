require 'rails_helper'

RSpec.describe Organisation, type: :model do
  it { is_expected.to have_many(:channels) }
end
