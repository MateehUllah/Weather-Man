module EMain
    def eMain(date,folder)
        highest=[]
        lowest=[]
        humid=[]
        for i in (1..12)
            path=createPath(date,folder)+"_#{$Months[i.to_s]}.txt"
            if(File.exist?(path))
                file=FilingHandler::Filing.new(path)
                obj=Factory.getObject("-e")
                if i===1
                    obj.setQuery("Max TemperatureC")
                    highest=obj.highestName(file.getTable)
                    obj.setQuery("Min TemperatureC")
                    lowest=obj.lowestName(file.getTable)
                    obj.setQuery("Max Humidity")
                    humid=obj.highestName(file.getTable)
                else
                    obj.setQuery("Max TemperatureC")
                    highest=getHighest(highest,obj.highestName(file.getTable))
                    obj.setQuery("Min TemperatureC")
                    lowest=getLowest(lowest,obj.lowestName(file.getTable))
                    obj.setQuery("Max Humidity")
                    humid=getHighest(humid,obj.highestName(file.getTable))
                end
            else
                next
            end
           
        end
        begin
            date=Date.parse(highest[0])
            puts "Highest:#{highest[1]}C on #{getDatePrompt(date.month,date.day)}"
            date=Date.parse(lowest[0])
            puts "Lowest:#{lowest[1]}C on #{getDatePrompt(date.month,date.day)}"
            date=Date.parse(humid[0])
            puts "Humid:#{humid[1]}% on #{getDatePrompt(date.month,date.day)}"
        rescue
            puts "Error"
        end
    end
end