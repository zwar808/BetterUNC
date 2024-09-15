# BetterUNC
BetterUNC is an opensource library for roblox executors
Aimed for scripting Easier

**Example:**
```lua
 local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/zwar808/BetterUNC/main/main.lua"))()
local url = "https://example.com/api"  -- Replace with your URL
local data = game:GetService("HttpService"):JSONEncode({
    key1 = "value1",
    key2 = "value2"
})  -- Replace with your data

local contentType = "application/json"  -- The content type of the data being sent
local headers = {
    ["Content-Type"] = contentType
}

Library.PostHttp(url, data, contentType, headers)

```














[Source](https://github.com/zwar808/BetterUNC/blob/main/main.lua)
