module Utils
    $Months={
        "01"=>"Jan",
        "02"=>"Feb",
        "03"=>"Mar",
        "04"=>"Apr",
        "05"=>"May",
        "06"=>"Jun",
        "07"=>"Jul",
        "08"=>"Aug",
        "09"=>"Sep",
        "10"=>"Oct",
        "11"=>"Nov",
        "12"=>"Dec",
        "1"=>"Jan",
        "2"=>"Feb",
        "3"=>"Mar",
        "4"=>"Apr",
        "5"=>"May",
        "6"=>"Jun",
        "7"=>"Jul",
        "8"=>"Aug",
        "9"=>"Sep",
    }
    def createPath(year,month=0,folder)
        path=""
        itemName=""
        if folder.include?("Dubai_weather")
            itemName="Dubai_weather"
        elsif folder.include?("lahore_weather")
            itemName="lahore_weather"
        elsif folder.include?("Murree_weather")
            itemName="Murree_weather"
        end
        if month==0
            path="./#{folder}/#{itemName}_#{year}"
        else
            path="./#{folder}/#{itemName}_#{year}_#{$Months[month]}"
        end
        return path
    end
    def getHighest(data1,data2)
        if data1[1].nil?
            return data2
        end
        if data2[1].nil?
            return data1
        end
        if data1[1]<data2[1]
            return data2
        else
            return data1
        end
    end
    def getLowest(data1,data2)
        if data1[1].nil?
            return data2
        end
        if data2[1].nil?
            return data1
        end
        if data1[1]>data2[1]
            return data2
        else
            return data1
        end
    end
    def getDatePrompt(month,day)
        return "#{$Months[month.to_s]} #{day}"
    end
    def horizontleBar_1(maxTemp,minTemp,date)
        puts "#{$Months[date[1]]} #{date[0]}"
        for i in (0...maxTemp[0].size)
            if !maxTemp[1][i].nil?
                if Integer(maxTemp[1][i])>-1
                    arr=Array.new(Integer(maxTemp[1][i]),"+".red)
                else
                    arr=Array.new(Integer(maxTemp[1][i])*-1,"-".red)
                end
                puts "#{Date.parse(maxTemp[0][i]).day} #{arr.join()} #{maxTemp[1][i]}C"
             else
                puts "#{Date.parse(maxTemp[0][i]).day} data not available"
            end
            if !minTemp[1][i].nil?
                if Integer(minTemp[1][i])>-1
                    arr=Array.new(Integer(minTemp[1][i]),"+".blue)
                else
                    arr=Array.new(Integer(minTemp[1][i])*-1,"-".blue)
                end

                puts "#{Date.parse(minTemp[0][i]).day} #{arr.join()} #{minTemp[1][i]}C"
            else
                puts "#{Date.parse(minTemp[0][i]).day} data not available"
            end
        
        end
     
    end

    def horizontleBar_2(maxTemp,minTemp,date)
        puts "#{$Months[date[1]]} #{date[0]}"
        for i in (0...maxTemp[0].size)
            arr1=[]
            arr2=[]
            
            if !maxTemp[1][i].nil?
                if Integer(maxTemp[1][i])>-1
                    arr1=Array.new(Integer(maxTemp[1][i]),"+".red)
                else
                    arr1=Array.new(Integer(maxTemp[1][i])*-1,"-".red)
                end
            end
            if !minTemp[1][i].nil?
                if Integer(minTemp[1][i])>-1
                    arr2=Array.new(Integer(minTemp[1][i]),"+".blue)
                else
                    arr2=Array.new(Integer(minTemp[1][i])*-1,"-".blue)
                end
            end
            if minTemp[1][i].nil? and maxTemp[1][i].nil?
                puts "#{Date.parse(maxTemp[0][i]).day} Data not Available"
            else
                puts "#{Date.parse(maxTemp[0][i]).day} #{arr2.concat(arr1).join()}  #{minTemp[1][i]}C-#{maxTemp[1][i]}C"
            end
        end
     
    end
end
