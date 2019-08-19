require 'rails_helper'

# RSpec.describe Review, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Review do

  it { should belong_to(:destination) }
  it { should validate_presence_of :user_name }
  it { should validate_presence_of :content }
  it { should validate_presence_of :rating }
  it { should validate_inclusion_of(:rating).in_range(1..5) }

end
