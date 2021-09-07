def fromRoman(romanNumber)
    romanMap =
    {
        "M" => 1000,
        "CM" => 900,
        "D" => 500,
        "CD" => 400,
        "C" => 100,
        "XC" => 90,
        "L" => 50,
        "XL" => 40,
        "X" => 10,
        "IX" => 9,
        "V" => 5,
        "IV" => 4,
        "I" => 1
    }

    # Split the roman string and make sure it contains only roman symbols.
    symbols = ["I","V","X","L","C","D","M"]
    symbolTest = true
    charList = romanNumber.split(//)
    charList.each{ |x| 
        if (!symbols.include? x)
            symbolTest = false
        end
    }

    if (symbolTest)
        arabicNumber = 0
        # For each of the keys in roman map, if the parameter starts with it, add the value to our return amount.
        romanMap.keys.each do |key|
            while romanNumber.start_with?(key)
                arabicNumber += romanMap[key]
                romanNumber = romanNumber.slice(key.length, romanNumber.length)
            end
        end
        return arabicNumber
    else
        raise TypeError
    end
    
end

def toRoman(arabicNumber)
    if arabicNumber >= 1 and arabicNumber <= 3999
        # Subtract the largest amount possible from arabicNumber and add the respective symbol to romanNumber.
        romanNumber = ''
        while arabicNumber != 0 do
            if ((arabicNumber - 1000) >= 0)
                romanNumber += "M"
                arabicNumber = arabicNumber - 1000
            elsif ((arabicNumber - 900) >= 0)
                romanNumber += "CM"
                arabicNumber = arabicNumber - 900
            elsif ((arabicNumber - 500) >= 0)
                romanNumber += "D"
                arabicNumber = arabicNumber - 500
            elsif ((arabicNumber - 400) >= 0)
                romanNumber += "CD"
                arabicNumber = arabicNumber - 400
            elsif ((arabicNumber - 100) >= 0)
                romanNumber += "C"
                arabicNumber = arabicNumber - 100
            elsif ((arabicNumber - 90) >= 0)
                romanNumber += "XC"
                arabicNumber = arabicNumber - 90
            elsif ((arabicNumber - 50) >= 0)
                romanNumber += "L"
                arabicNumber = arabicNumber - 50
            elsif ((arabicNumber - 40) >= 0)
                romanNumber += "XL"
                arabicNumber = arabicNumber - 40
            elsif ((arabicNumber - 10) >= 0)
                romanNumber += "X"
                arabicNumber = arabicNumber - 10
            elsif ((arabicNumber - 9) >= 0)
                romanNumber += "IX"
                arabicNumber = arabicNumber - 9
            elsif ((arabicNumber - 5) >= 0)
                romanNumber += "V"
                arabicNumber = arabicNumber - 5
            elsif ((arabicNumber - 4) >= 0)
                romanNumber += "IV"
                arabicNumber = arabicNumber - 4
            elsif ((arabicNumber - 1) >= 0)
                romanNumber += "I"
                arabicNumber = arabicNumber - 1
            end
        end
        return romanNumber
    else
        raise RangeError
    end
end