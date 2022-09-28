module Queries
    class Query
        def initialize(queryName)
            @queryName=queryName
        end
        def setQuery(queryName)
            @queryName=queryName
        end
    end
    class AQuery <Query
        def Average(table)
            arr=table[@queryName].compact
            sum=0
            arr.each do |i|
                sum=sum+i.to_i
            end
            return sum/arr.size
        end
    end
    class CQuery<Query
        def getData(table)
            str=""
            if table.headers.include?("PKST")
                str="PKST"
            elsif table.headers.include?("GST")
                str="GST"
            else
                str="PKT"
            end
            date=table[str]
            data=table[@queryName]
            return date,data
        end
    end
    class EQuery<Query
        def lowestName(table)
            str=""
            if table.headers.include?("PKST")
                str="PKST"
            elsif table.headers.include?("GST")
                str="GST"
            else
                str="PKT"
            end
            date=table[str][0]
            data=table[@queryName][0].to_i
            for i in  (0...table[str].size)
                if table[@queryName][i].to_i<data and !table[@queryName][i].nil?
                    date=table[str][i]
                    data=table[@queryName][i].to_i
                end
            end
            return date,data
        end
        def highestName(table)
            str=""
            if table.headers.include?("PKST")
                str="PKST"
            elsif table.headers.include?("GST")
                str="GST"
            else
                str="PKT"
            end
            date=table[str][0]
            data=table[@queryName][0].to_i
            for i in  (0...table[str].size)
                if table[@queryName][i].to_i>data 
                    date=table[str][i]
                    data=table[@queryName][i].to_i
                end
            end
            return date,data
        end
    end
end