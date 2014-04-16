--[[
	a HTML/CSS generator, designed to make updating the site easier
--]]
local programs={
	{"Kenny's programs","https://github.com/OpenPrograms/Kenny-Programs",
		{"CompVeiwer",
			"GUI component veiwer",
			"/blob/master/CompViewer/CompViewer.lua",
		},
		{"LC Control",
			"GUI stargate controller",
			"/blob/master/LC_Control/stargate.lua",
		},
		{"Adventure",
			"CC adventure ported to OC",
			"/blob/master/adventure.lua",
		},
		{"KS",
			"Easy to use term API",
			"/blob/master/ks.lua",
		},
	},
	{"Symmetryc's programs","https://github.com/OpenPrograms/Symmetryc-Programs",
		-- Y U NO?
	},
	{"Gopher's programs","https://github.com/OpenPrograms/Gopher-Programs",
		{"GML",
			"Useful GUI API",
			"/tree/master/gml"
		},
		{"gitrepo",
			"Github downloader",
			"/blob/master/gitrepo.lua",
		},
	},
	{"Wobbo's programs","https://github.com/OpenPrograms/Wobbo-Programs",
		{"energyd",
			"Deamon for managing the energy levels",
			"/blob/master/energyd/energyd.lua",
		},
		{"getopt",
			"Command line argument parser",
			"/blob/master/getopt/getopt.lua",
		},
		{"logging",
			"Port of Lua-Logging",
			"https://github.com/OpenPrograms/Lua-Logging/tree/master/lib",
		},
	},
	{"Vexatos's programs","",
		{"OCGithub",
			"Not functional",
			"https://github.com/OpenPrograms/OCGithub/blob/master/src/launcher.lua"
		},
		{"example",
			"Hello world",
			"https://github.com/OpenPrograms/MiscPrograms/blob/master/Vexatos/example.lua",
		},
	},
	{"JoshTheEnder's programs","https://github.com/OpenPrograms/JoshTheEnder-Programs",
		{"DNS Serv",
			"Not functional",
			"https://github.com/OpenPrograms/JoshTheEnder-Programs/blob/master/DNS_Serv.lua",
		},
	},
	{"Sangar's programs","https://github.com/OpenPrograms/Sangar-Programs",
		{"holo flow",
			"Creates a terrain like hologram",
			"/blob/master/holo-flow.lua"
		},
		{"holo text",
			"Makes scrolling text above terrain",
			"/blob/master/holo-text.lua",
		},
		{"noise",
			"Perlin noise and more API",
			"/blob/master/noise.lua",
		},
	},
	{"Dustbin's programs","",
		{"LibCompress",
			"Compression API",
			"https://github.com/OpenPrograms/LibCompress/blob/master/LibCompress.lua"
		},
	},
	{"PixelToast's programs","https://github.com/OpenPrograms/Pixel-Programs",
		{"TCPNet",
			"Cross-server communication",
			"https://github.com/P-T-/TCPNet",
		},
		{"base64",
			"Fast b64 converter",
			"/blob/master/b64.lua",
		},
		{"holo menger",
			"Hologram menger sponge",
			"/blob/master/hologram/menger.lua",
		},
		{"holo sphere",
			"Hologram sphere",
			"/blob/master/hologram/sphere.lua",
		},
		{"holo text",
			"Hologram dynamic text",
			"/blob/master/hologram/sphere.lua",
		},
		{"agony",
			"Agony esolang",
			"/blob/master/esolangs/agony.lua",
		},
		{"barely",
			"Barely esolang",
			"/blob/master/esolangs/barely.lua",
		},
		{"befunge",
			"Befunge esolang",
			"/blob/master/esolangs/begunge.lua",
		},
		{"brainfuck",
			"Brainfuck esolang",
			"/blob/master/esolangs/brainfuck.lua",
		},
		{"malbolge",
			"Malbolge esolang",
			"/blob/master/esolangs/malbolge.lua"
		},
		{"superstack",
			"SuperStack! esolang",
			"/blob/master/esolangs/superstack.lua"
		},
	},
}
local css=[[
body {
	background-color:#101010;
	color:#101010;
	font-family:Arial, Helvetica, sans-serif
}
a:link {text-decoration:none;}
a:visited {text-decoration:none;}
a:hover {text-decoration:none;}
a:active {text-decoration:none;}
a {
	font-weight:bold;
	color:#101010;
}
h2 {
	background-color:#F0F0F0;
	color:#101010;
}
#programs {
	font-weight:bold;
	color:#101010;
	background-color:#F0F0F0;
	border-radius:5px;
	font-size:130%;
	text-align:center;
}
table, td {
	border:0px;
}
]]
local html=[[
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="style.css">
	</head>
	<body>
		<br><center><a href="https://github.com/OpenPrograms"><img src="logo.png"></a></center><br>
]]
for _,dat in pairs(programs) do
	local name=dat[1]
	if #dat[2]>0 then
		html=html.."\t\t<br><a href=\""..dat[2].."\"><div id=\"programs\">"..name.."</a>"
	else
		html=html.."\t\t<br><div id=\"programs\">"..name
	end
	html=html.."<br>\n\t\t<table>\n"
	for ind=3,#dat do
		local pdat=dat[ind]
		if pname~=1 then
			local url=pdat[3]
			if url:sub(1,1)=="/" then
				url=dat[2]..url
			end
			html=html.."\t\t\t<tr><td><a href=\""..url.."\">"..pdat[1].."</a></td><td>: "..pdat[2].."</td></tr>\n"
		end
	end
	html=html.."\t\t</table></div>\n"
end
local date=os.date("*t")
html=html.."<h5>Generated on "..date.month.."/"..date.day.." at "..date.hour..":"..("0"):rep(2-#tostring(date.min))..date.min.."</h5>\n\t</body>\n</html>"
local file=assert(io.open("index.html","w"))
file:write(html)
file:close()
local file=assert(io.open("style.css","w"))
file:write(css)
file:close()
