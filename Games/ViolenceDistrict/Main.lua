                        
local HttpService = game:GetService("HttpService")
local ok, err = pcall(request, {
    Url = "http://127.0.0.1:6463/rpc?v=1",
    Method = "POST",
    Headers = {
        ["Content-Type"] = "application/json",
        ["Origin"] = "https://discord.com"
    },
    Body = HttpService:JSONEncode({
        cmd = "INVITE_BROWSER",
        nonce = HttpService:GenerateGUID(false),
        args = { code = "sn2Etx6M8G" }
    })
})

if not ok then
    warn("Uhm didnt work", err)
end

game.Players.LocalPlayer:Kick("Script is currently in maintenance, please check back later \n\n https://discord.gg/uJhAC8nhJ7")
