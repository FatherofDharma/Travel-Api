require 'rails_helper'

# RSpec.describe Destination, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Destination do

it { should have_many (:reviews) }
it { should validate_presence_of :city }
it { should validate_presence_of :country }

end
