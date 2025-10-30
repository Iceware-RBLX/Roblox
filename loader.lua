--[[
   
]]


if game:GetService('ContentProvider').RequestQueueSize > 10 then           
    repeat task.wait()
    until game:GetService('ContentProvider').RequestQueueSize <= 10
end


local shared = {
    version = "V3.0.0";
    folders = {
        main = 'IceWare',
        games = 'IceWare/Games',
        analytics = 'IceWare/Analytics',
    };
}

for _, folder in pairs(shared.folders) do
    if not isfolder(folder) then
        print(string.format("<font color='rgb(150,220,255)' size='18'>[ ICEWARE ]  Setting up %s folder.</font>", folder))
        makefolder(folder)
    end
end

writefile("IceWare/Discord.txt", "https://discord.gg/sn2Etx6M8G")

local games = {
    [{13864661000}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/Others/Lobbies.lua"; -- Break In 2 (Lobby)
    [{13864667823}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/Break%20In%202/Main.lua"; -- Break In 2 (Main Match)
    [{93978595733734}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/ViolenceDistrict/Main.lua"; -- Violence District
    [{79546208627805}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/Others/Lobbies.lua"; -- 99 Nights (Lobby)
    [{126509999114328}] = "https://raw.githubusercontent.com/Iceware-RBLX/Roblox/refs/heads/main/Games/Others/Lobbies.lua"; -- 99 Nights (Main Match)

}

for ids, url in next, games do
    if table.find(ids, game.PlaceId) then
        task.wait(); loadstring(game:HttpGet(url))()
    end
end


if getgenv().Settings and getgenv().Settings.Analytics then
    game:GetService("LogService").MessageOut:Connect(function(...) 
        appendfile("IceWare/analytics/" .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. "_" .. os.date("%Y-%m-%d") .. ".log", "[" .. os.date("%H:%M:%S") .. "] [" .. identifyexecutor() .. "] " .. select(1, ...) .. "\n") 
    end)
end

