module FilingHandler
    class Filing
        def initialize(filename)
          @filename = filename
        end
        def getTable
            begin
                if @filename.include?("lahore_weather")
                    table=""
                    File.open(@filename, "r",).each_with_index do |line, index|
                        next if index == 0 
                        if !line.include?("<!--")
                           table.concat(line)
                        end
                    end
                    table=CSV.parse(table,headers:true)
                    return table 
                else
                    table = CSV.parse(File.read(@filename), headers: true)
                    return table
                end
                
            rescue
                puts "File doesn't exist"
            end
        end
    end
end