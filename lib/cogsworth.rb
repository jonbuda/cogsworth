module Cogsworth
  class << self
    MULTIPLIERS = {
      "s" => (1),
      "m" => (60),
      "h" => (60 * 60),
      "d" => (60 * 60 * 24)
    }
    
    def parse(string)
      string.gsub(' ','').downcase.scan(/(\d+)([a-zA-Z]+)/).inject(0) do |sum, pair|
        sum += pair[0].to_i * MULTIPLIERS[pair[1].slice(0,1)]
      end
    end
    
    def unparse(seconds, results=[])
      return results.join(' ') if seconds == 0
      
      ['d','h','m','s'].each do |unit|
        occurrences = seconds/MULTIPLIERS[unit]
        return unparse(seconds%MULTIPLIERS[unit], results.push("#{occurrences}#{unit}")) if occurrences > 0
      end
      
      return unparse(seconds, results)
    end
  end
end
