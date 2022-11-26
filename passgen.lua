choice = {
    ["1"] = function() --ASCII password: arg 2 is character length
        chars={}
        password = ""
        charlength = math.floor(tonumber(arg[2]))
        for i = 0, charlength-1 do
            chars[i] = string.char(math.random(33, 126))
            password = password .. chars[i]
        end
        print(password)
    end,
    ["2"] = function() --Dictionary password: arg 2 is keyword length, arg 3 is dictionary text file
        if (arg[3] == nil)
        then
            return
        end
        keywords={}
        randompick={}
        password = ""
        wordlength = math.floor(tonumber(arg[2]))
        dictionary = io.open(arg[3], "r")
        io.input(dictionary)
        a=0
        b=true
        while (b == true)
        do
            lineread = io.read("l")
            if (lineread ~= nil)
            then
                keywords[a] = lineread
                a = a+1
            else
                b=false
            end
        end
        for i = 0, wordlength - 1 do --Randomize the words to create the password
            randompick[i] = keywords[math.random(0, a-1)]
            while (randompick[i] == randompick[i-1]) do -- Equal Keywords cannot be side by side
                if (randompick[i] == randompick[i-1])
                then
                    randompick[i] = keywords[math.random(0, a-1)]
                end
            end
            password = password .. randompick[i] .. " "
        end
        print(password)
    end
}
if (choice[arg[1]])
then
    choice[arg[1]]()
end
