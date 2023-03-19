local Players = game:GetService("Players")

local cname = "chatlogs\"" .. tick() .. "." .. game.Name .. ".txt"
local msgs = {}

--[[

	FORMAT:

	tick() | os.date(%c) | Displayname (@sender): msg
	1586982482 | 09/16/98 23:48:10 | fav (@Faave): man it doesnt matter if she 15 my nigga, i like young girls, i like em 14, 15, 16, i like em real young my nigga


]]

local function log(plr)
	plr.Chatted:Connect(function(msg)
		msg = tostring(message)
		msgs[#msgs+1] = tick() .. " | " .. os.date("%c") .. " | " .. plr.DisplayName .. " (@" .. plr.Name .. "): " .. msg
	end)
end

for _, plr in pairs(Players:GetPlayers()) do
	log(plr)
end

Players.PlayerAdded:Connect(function(plr)
	log(plr)
end)


local function write()
	repeat wait() until #msgs > 0
	local str = ""
	for i, v in pairs(msgs) do
		str += tostring(v)
		if i ~= #msgs then
			str += "\n"
		end
	end
	writefile(cname, str)
end


while true do
	write()
	wait(10)
end