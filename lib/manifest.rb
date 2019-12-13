class Manifest 
  #attr_reader :manifest 
  def self.traverse(h, path)
    parts = path.split('/', 1).reject { |e| e.to_s.empty? }
    parts
#    parts.each do |part|
#      if h.is_a?(Hash) 5k
#    end
  end
end
