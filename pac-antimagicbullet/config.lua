Config = {}

-- [[----------------------Log System---------------------------]]
Config.Tolerance = 3 -- If the player kills more than the number of times you set and does not see it, they will be banned from the server

-- [[----------------------Log System---------------------------]]
Config.SendWebhook = false
Config.WebhookURL = ""

-- [[----------------------Punishment---------------------------]]
Config.Ban = false -- If this setting is true, you can use your own ban system.
Config.DropMessage = "Magic bullet detected." -- If you set ban setting to false you can select your own drop message.
Config.BanFunction = function(source)
    -- You can trigger your ban event.
end