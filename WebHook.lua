local function webhook()
	pcall(function()
    	XP = tostring(game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.LevelRewards.ScrollingFrame.XPReward.Main.Amount.Text)
		gems = tostring(game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.LevelRewards.ScrollingFrame.GemReward.Main.Amount.Text)
		cwaves = game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.Middle.WavesCompleted.Text
		ctime = game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.Middle.Timer.Text
		waves = cwaves:split(": ")
		ttime = ctime:split(": ")
		
		local data = {
			["content"] = "",
			["username"] = "Anime Adventures",
			["avatar_url"] = "https://tr.rbxcdn.com/e5b5844fb26df605986b94d87384f5fb/150/150/Image/Jpeg",
			["embeds"] = {
			{

					["author"] = {
						["name"] = "Anime Adventures",
						["icon_url"] = "https://cdn.discordapp.com/emojis/997123585476927558.webp?size=96&quality=lossless"
					},
					["color"] = 10105766,

					["fields"] = {
						{
                            ["name"] = "",
                            ["value"] = "**Name:** " .. game:GetService("Players").LocalPlayer.Name,
                            ["inline"] = false
                        }, {
							["name"] = "",
                            ["value"] = "**Current Level:** " .. tostring(game.Players.LocalPlayer.PlayerGui.spawn_units.Lives.Main.Desc.Level.Text).. " ✨",
                            ["inline"] = false
                        }, {
							["name"] = "",
							["value"] = "**Total Waves:** " .. tostring(waves[2]) .. " <:wave:997136622363627530>",
							["inline"] = false
						}, {
							["name"] = "",
							["value"] = "**Recieved Gems:** " .. gems:sub(2, #gems) .. " <:gem:997123585476927558>",
							["inline"] = false
						}, {
                            ["name"] = "",
                            ["value"] = "**Recieved XP:** " .. XP:sub(2, #XP - 3) .. " 🧪",
                            ["inline"] = false
                        }, {
                            ["name"] = "",
                            ["value"] = "**Total Time:** " .. tostring(ttime[2]) .. " ⏳",
                            ["inline"] = false
                        }, {
                            ["name"] = "",
                            ["value"] = "**Current Gems:** " .. tostring(game.Players.LocalPlayer._stats.gem_amount.Value).." <:gem:997123585476927558>",
                            ["inline"] = false
                        }
					}
				}
			}
		}
		
		local body_msg = game:GetService("HttpService"):JSONEncode(data)
		local headers = {["content-type"] = "application/json"}
		request = http_request or request or HttpPost or syn.request or http.request
		local send_msg = {Url = "https://discord.com/api/webhooks/1065163926460960768/7xnxdytUEn5d_2A7wfpdqseeDz7lnXU4Rm_K2OzFAqVSJ537mGlRM0g1pr2ruHSPB4oH", Body = body_msg, Method = "POST", Headers = headers}
		request(send_msg)
	end)
end

coroutine.resume(coroutine.create(function()
    game:GetService("Workspace"):WaitForChild("_DATA"):WaitForChild("GameFinished"):GetPropertyChangedSignal("Value"):Connect(function()
        if game:GetService("Workspace"):WaitForChild("_DATA"):WaitForChild("GameFinished").Value == true then
            repeat task.wait() until game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Enabled == true
				task.wait()
				
            pcall(function() webhook() end)

			local exec = tostring(identifyexecutor())
			if exec == "Synapse X" then
				syn.queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/oXEKo/AutoFarmDiscordWebHook/main/AutoFarmDiscordWebHook'))()")
			else
				queue_on_teleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/oXEKo/AutoFarmDiscordWebHook/main/AutoFarmDiscordWebHook'))()")
			end
        end
	end)
end))
