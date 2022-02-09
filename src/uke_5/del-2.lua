local Players = game:GetService("Players")

local function onCharacterAdded(character, player)
	local humanoid = character:WaitForChild("Humanoid")
	print(humanoid)
	humanoid.Died:Connect(function()
		print("døde")
		local poeng = player.leaderstats.Poeng
		poeng.Value = 0
	end)

end

local function spillerLagtTil(spiller)
	local poengtavle = Instance.new("Folder")
	poengtavle.Name = "leaderstats"
	poengtavle.Parent = spiller

	local poeng = Instance.new("IntValue")
	poeng.Name ="Poeng"
	poeng.Value = 0
	poeng.Parent = poengtavle

	spiller.CharacterAdded:Connect(function(character)
		onCharacterAdded(character, spiller)
	end)
end

Players.PlayerAdded:Connect(spillerLagtTil)

while true do
	wait(1)
	local spillerListe = Players:GetPlayers()
	for spillerNummer = 1, #spillerListe do
		local denneSpilleren = spillerListe[spillerNummer]
		local poeng = denneSpilleren.leaderstats.Poeng
		poeng.Value = poeng.Value + 1
	end
end
