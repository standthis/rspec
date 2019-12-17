class Manifest 
  def self.traverse(h, path)
    first, *rest = path.split('/').reject { |e| e.to_s.empty? }
    rest = rest.join('/')

    if rest == ""
      if first.include?('=')
        components = first.split('=')
        found = h.find { |pair| pair[components.first] == components.last } 
        return found
      end
      return h[first]
    end  

    if first.include?('=')
      components = first.split('=')
      found = h.find { |pair| pair[components.first] == components.last } 
      return traverse(found, rest)
    end

    if h.is_a?(Hash)
      if h.key?(first)
        return traverse(h[first], rest)
      end
    end
    raise NotImplementedError
  end
end
