module Cogsworth
  class << self
    MULTIPLIERS = {
      "s" => (1),
      "m" => (60),
      "h" => (60 * 60),
      "d" => (60 * 60 * 24)
    }
    
    def string_to_seconds(string)
      string.gsub(' ','').downcase.scan(/(\d+)([a-zA-Z]+)/).inject(0) do |sum, pair|
        sum += pair[0].to_i * MULTIPLIERS[pair[1].slice(0,1)]
      end
    end
    
    def seconds_to_string(seconds, results=[])
      return results.join(' ') if seconds == 0
      
      ['d','h','m','s'].each do |unit|
        occurrences = seconds/MULTIPLIERS[unit]
        return seconds_to_string(seconds%MULTIPLIERS[unit], results.push("#{occurrences}#{unit}")) if occurrences > 0
      end
      
      return seconds_to_string(seconds, results)
    end
  end
end
