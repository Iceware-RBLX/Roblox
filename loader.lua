
if game:GetService('ContentProvider').RequestQueueSize > 10 then           
    repeat task.wait()
    until game:GetService('ContentProvider').RequestQueueSize <= 10
end

game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)


local shared = {
    version = "V1";
    folders = {
        main = 'IceWare',
        games = 'IceWare/Games',
    };
}

for _, folder in pairs(shared.folders) do
    if not isfolder(folder) then
        makefolder(folder)
    end
end

writefile("IceWare/Discord.txt", "https://discord.gg/sn2Etx6M8G")
writefile("IceWare/Version.txt", shared.version)

local games = {
    [{13822562292, 139048751758942, 133327835421432, 121510074321001}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/MidnightChasers/Main.lua"; -- Midnight Chasers
    [{3351674303, 71775212858107}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/DrivingEmpire/Main.lua"; -- Driving Empire
    [{1554960397}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/CDT/Main.lua"; -- Car Dealership Tycoon
    [{97598239454123, 77085202503540}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/GAG2/Main.lua"; -- GAG 2
}

for ids, url in next, games do
    if table.find(ids, game.PlaceId) then
        loadstring(game:HttpGet(url))()
    end
end
