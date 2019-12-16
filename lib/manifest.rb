class Manifest 
  #attr_reader :manifest 
  def self.traverse(h, path)
    parts = path.split('/', 3).reject { |e| e.to_s.empty? }
    self.matchequal(h, parts)
    if parts.length == 1
      if parts.first.include?('=')
        return h.first
      else
        return h[parts.first]
      end
    else  
      if h.is_a?(Hash)
        if h.key?(parts.first)
          traverse(h[parts.first], parts.last)
        end
      elsif h.is_a?(Array)
        if h.include?(parts.first)
          traverse(h[h.find_index(parts.fist)], parts.last)
        end
      end
    end
  end
  def self.matchequal(h, component)
    if component.include?('=')
      if component.length == 1
        return h.first
      else
        comps = component.split('=')
        if h.first.has_value?(comps.last)
          traverse(h.first, component.last)
        end
      end
    end
  end
end
