class Manifest 

  def self.traverse(h, path)
    parts = path.split('/', 3).reject { |e| e.to_s.empty? }
    parts = [parts.first, parts[1..-1].join('/')]
    puts "#{h} #{parts.inspect}"
    if parts.length == 1 
      if parts.first.include?('=')
        comps = parts.first.split('=')
        dd = h.find { |pair| pair[comps.first] == comps.last } 
        puts '1'
        return dd
      end
      return h[parts.first]
    end  
    if parts.first.include?('=')
      comps = parts.first.split('=')
      dd = h.find { |pair| pair[comps.first] == comps.last } 
      puts '3'
      return traverse(dd, parts.last)
    end

    if h.is_a?(Hash)
      if h.key?(parts.first)
        puts '4'
        return traverse(h[parts.first], parts.last)
      end
    end
    raise NotImplementedError
  end

end
