require 'manifest'

RSpec.describe Manifest do
  context "Traversal of manifest yml using BOSH ops path" do
    [
      #{
      #  h: { 'a' => 1 },
      #  path: 'a',
      #  expected: 1
      #},
      #{
      #  h: { 'a' => { 'b' => 2 } },
      #  path: '/a/b',
      #  expected: 2
      #},
      #{ 
      #  h: {'a' => [{'b' => 'value'}]},
      #  path: '/a/b=value',
      #  expected: {'b' => 'value'}
      #},
      #{
      #  h: { 'a' => [ { 'b' => 'value', 'c' => { 'd' => 'e'} }, { 'n' => 'value' } ] },
      #  path: '/a/b=value/c',
      #  expected: { 'd' => 'e'}
      #},
      {
        h: { 'a' => [ { 'b' => 'value', 'c' => { 'd' => 'e'} }, { 'n' => 'value' } ] },
        path: '/a/b=value/c/d',
        expected: 'e'
      }
    ].each do |entry|
      it "works" do
        expect(Manifest.traverse(entry[:h], entry[:path])).to eql(entry[:expected])
      end
    end
  end
end
