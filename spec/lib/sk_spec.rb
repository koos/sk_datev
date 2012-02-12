require 'spec_helper'
describe Sk do
  it "should read schema" do
    hsh = Sk.read_schema('client')
    hsh['title'].should == 'client'
  end
end