Dwarfish = {}
Dwarfish.version = "0.0.1"
Dwarfish.debug = false

	------------------------------------------------------------------
	-- Dwarvish Dialect:    		--
	--	This is highly based on the Scottish dialect 		--
	--	from Lore.  Since Dwarves tend to have a Scottish	--
	--	accent I have kept this largely as is, except in 	--
	--	areas where the word is too different from normal	--
	--	or the word can be different parts of speech and 	--
	--	therefore not really apply			 	--
	------------------------------------------------------------------
local translation = {
    ["good"]	=	"gud",
    ["the"]	=	"tha",
    ["to"]	=	"tu",
    ["back"]	=	"beck",
    ["yes"]		=	"aye",
    ["a baby"]	=	"a wee one",
    ["the baby"]	=	"the wee one",
    ["little baby"]	=	"wee one",
    ["child"]	=	"bairn",
    ["kid"]		=	"bairn",
    ["children"]	=	"bairn",
    ["kids"]	=	"bairn",
    ["moron"]	=	"bampot",
    ["splendid"]	=	"barry",
    ["drink"]	=	"bewy",
    ["alcohol"]	=	"bewy",
    ["drunk"]	=	"hammered",
    ["cold"]	=	"cauld",
    ["do"]		=	"de",
    
    ["understand"]	=	"ken",
    ["dog"]		=	"dug",
    ["idiot"]	=	"idjit",
    ["ass"]		=	"arse",
	
    ["don't"]	=	"dunnae",
    ["do not"]	=	"dunnae",
    ["cannot"]	=	"cannae",
    ["can't"]	=	"cannae",
	
    ["shit"]	=	"shite",
    ["fucking"]	=	"bloody",
    ["fuck"]	=	"bloody hell",
    ["fuckin'"]	=	"bloody",
    ["fuckin"]	=	"bloody",
    ["fuckn"]	=	"bloody",
    ["crazy"]	=	"barmy",
    ["a crazy"]	=	"a loon",
    ["the crazy"]	=	"the loon",
    ["not"]		=	"nae",
    ["oh"]		=	"och",
    ["small"]	=	"wee",
    ["wife"]	=	"wifey",
    ["and"]		=	"an'",
    ["old"]		=	"ol'",
    ["newbie"]	=	"youngin'",
    ["newb"]	=	"youngin'",
    ["noob"]	=	"choob'",
    ["n00b"]	=	"choob'",
    ["you"]		=	"ye",
    ["mom"]		=	"mum",
    ["mother"]	=	"mammy",
    
    ["night"]	=	"nait",
    ["a little"]	=	"a wee bit",
    ["goodbye"]	=	"be good",
    ["good bye"]	=	"be good",
    
    ["no"] = "nae",
    ["isn't"] = "ain't",
    ["about"] = "aboot",
    ["around"]="'roon",
    ["before"]="'fore",
    ["between"]="a'tween",
    ["can"]="kin",
    ["can't"] = "cannae",
    ["couldn't"]= "couldnae",
    ["dead"]="deid",
    ["gone"]="guan",
    ["was"]="wer",
    ["understand"]="unnerstan'",
    ["you"]		=	"ye",
    ["your"]	=	"yer",
    ["bye"]		=	"keep yer feet on tha ground",
}
Dwarfish.translation = translation

local function init()
        print("Dwarfish - version " .. Dwarfish.version);
	SendChatMessage("'Ave no fear, ah'm 'ere!", "SAY", nil, nil);
end

local function log(message) 
       if Dwarfish.debug==true then
         print(message);
       end    
end

init();

function changeWord(word)
    local newWord = word
    for key,value in pairs(translation) do 
        if key:upper() == word:upper() then
            newWord = value
        end
    end   
    return newWord
end

function translate(msg)
    log("translate")
    local tbl = { strsplit(" ", msg) }
    local newmsg = ""
    for key,value in pairs(tbl) do 
--        print(key,value)
        newmsg = newmsg .. changeWord(value) .. " "
    end
    return newmsg
end

local Send = SendChatMessage

function SendChatMessage(msg,chan,...)
    chan=chan:upper();--    Convert to make checks easier (channel is case-insensitive)
    log("local SendChatMessage " .. msg .. chan);
    -- CHANNEL and YELL
    if chan=="SAY" then
        Send(translate(msg),chan,...);
    else
        Send(msg,chan,...);
    end
end
