module Utils
  class TravelDatasetUtil
    def self.generate_dataset(params)
      result = {"day1"=>{},"day2"=>{},"day3"=>{},"day4"=>{},"day5"=>{},"day6"=>{},"day7"=>{}}

      for num in 1...7 do
        params.keys.each do |key|
          if key.include?("day" + num.to_s)
            result["day" + num.to_s][key] = params[key]
          end
        end
      end
      return result.to_json
    end
  end
end