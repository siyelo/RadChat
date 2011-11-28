require 'spec_helper'

describe CompanyMembership do
  it { should belong_to(:user) }
  it { should belong_to(:company) }
end
