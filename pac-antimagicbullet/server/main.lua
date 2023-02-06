function ExtractIdentifiers(src)
    local identifiers = {
        steam = "N/A",
        ip = "N/A",
        discord = "N/A",
        license = "N/A",
        xbl = "N/A",
        live = "N/A",
        tokens = "N/A",
        fivem = "N/A"
    }
    
    for k,v in ipairs(GetPlayerIdentifiers(src)) do
        if v:match("^steam:") then
            identifiers.steam = v
        elseif v:match("^license:") then
            identifiers.license = v
        elseif v:match("^live:") then
            identifiers.live = v
        elseif v:match("^xbl:") then
            identifiers.xbl  = v
        elseif v:match("^discord:") then
            identifiers.discord = v
        elseif v:match("^ip:") then
            identifiers.ip = v
        elseif v:match("^fivem:") then
            identifiers.fivem = v
        end
    end

    for i = 0, GetNumPlayerTokens(src) - 1 do 
        identifiers.tokens = GetPlayerToken(src, i)
    end

    return identifiers
end

function SendDiscord(source,title,des,color)
    if GetPlayerName(source) == nil or Config.WebhookURL == "" or Config.SendWebhook == false then
        return
    end

    local id = ExtractIdentifiers(source);
    
    embed = {{
        ["author"] = {
            ["name"] = "PAC - Perdition Anticheat",
            ["icon_url"] = "https://cdn.discordapp.com/avatars/864103944442347570/6d54717b41c2879e35f1e13c9bf06deb.webp",
            ["url"] = "https://discord.gg/amsgn3zExM"
        },
        ["color"] = color,
        ["fields"] = {
            { ["name"] = "User Details", ["value"] = "\n**Name:** "..GetPlayerName(source).."\n**Ingame ID:** "..source.."\n**Ping:** "..GetPlayerPing(source).."\n**IP:** "..string.gsub(id.ip, "ip:", "").."\n**Steam:** "..id.steam.."\n**FiveM:** "..id.fivem.."\n**License:** "..id.license.."\n**Token:** ".. id.tokens .."\n**Discord:** <@!"..string.gsub(id.discord, "discord:", "")..">\n**XBL:** "..id.xbl.."\n**Live:** "..id.live, ["inline"] = true },
            { ["name"] = "Detection Details", ["value"] = "\n**Reason:** "..title.."\n**Details:** "..des.."", ["inline"] = true },
            { ["name"] = "Server Hostname", ["value"] = "```"..GetConvar("sv_hostname").."```" }
        },
        ["footer"] = {
            ["text"] = "https://discord.gg/amsgn3zExM",
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }
        
    }}

    PerformHttpRequest(Config.WebhookURL, function(err, text, headers) end, 'POST', json.encode({embeds  = embed}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("pac:magicbullet", function(source, subject, description)
    local src = source
    if (Config.Ban) then
        SendDiscord(src, subject, description, 0000000)
        Config.BanFunction(src)
    else
        SendDiscord(src, subject, description, 0000000)
        DropPlayer(src, Config.DropMessage)
    end
end)