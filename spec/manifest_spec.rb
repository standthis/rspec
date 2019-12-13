require 'manifest'

RSpec.describe Manifest do
  context "Traversal of manifest yml using BOSH ops path" do
    it "simple hash" do
      h = { 'a' => 1 }
      expect(Manifest.traverse(h,'/a')).to eql(1)
    end
    
    it "another simple hash traversal" do 
      h = { 'a' => { 'b' => 2 } }
      expect(Manifest.traverse(h, '/a/b')).to eql(2)
    end

    it "yash" do
      h = { 'a' => [ { 'b' => 'value' } ] } 
      expect(Manifest.traverse(h, '/a/b=value')).to eql({'b' => 'value'})
    end
  end
end
