require 'spec_helper'

describe Role do
	let(:role) {FactoryGirl.create(:role) }
  	
  	subject { role }

  	it {should respond_to(:name) }
end
