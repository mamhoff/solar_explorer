require 'spec_helper'

describe Tour do
  let(:tour) { FactoryGirl.create(:tour) }

  subject { tour }

  it { should respond_to(:name) } 
end
