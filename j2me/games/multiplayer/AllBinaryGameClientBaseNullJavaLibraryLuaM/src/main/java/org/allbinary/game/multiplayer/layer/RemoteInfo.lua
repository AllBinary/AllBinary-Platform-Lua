-- 
-- To change this license header, choose License Headers in Project Properties. 
-- To change this template file, choose Tools | Templates 
-- and open the template in the editor.  
-- Generated Code Do Not Modify
-- package org.allbinary.game.multiplayer.layer

local StringUtil = require("org.allbinary.logic.string.StringUtil")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RemoteInfo = {}
RemoteInfo.__index = RemoteInfo
RemoteInfo.className = "RemoteInfo"


function RemoteInfo.new(username, actorSessionId, playerInputId, id)
    local self = setmetatable({}, RemoteInfo)
    return self
end

RemoteInfo.NEW_PLAYER_ID = 0
RemoteInfo.REMOTE_INFO = RemoteInfo.new(StringUtil.getInstance().EMPTY_STRING, -1, -1, RemoteInfo.NEW_PLAYER_ID)

return RemoteInfo

