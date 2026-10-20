--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
-- 
-- By agreeing to this license you and any business entity you represent are
-- legally bound to the AllBinary Open License Version 1 legal agreement.
-- 
-- You may obtain the AllBinary Open License Version 1 legal agreement from
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository.
-- 
-- Created By: Travis Berthelot
--  
-- Generated Code Do Not Modify
-- package org.allbinary.logic.communication.log.config.type

local LogConfigTypes = require("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local LogConfigTypeFactory = require("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LogConfigTypeFactory = {}
LogConfigTypeFactory.__index = LogConfigTypeFactory
LogConfigTypeFactory.className = "LogConfigTypeFactory"

function LogConfigTypeFactory:_init_fields()
    self.NO_DESCRIPTION = "No Description"
    self.INIT_SERVER = LogConfigType.new("Init Server", self.NO_DESCRIPTION)
    self.LOBBY_SERVER = LogConfigType.new("Lobby Server", self.NO_DESCRIPTION)
    self.GAME_SERVER = LogConfigType.new("Game Server", self.NO_DESCRIPTION)
    self.GAME_SIMULATOR = LogConfigType.new("Game Simulator", self.NO_DESCRIPTION)
    self.CUSTOM_TYPES = LogConfigType.new("Custom Types", self.NO_DESCRIPTION)
end


function LogConfigTypeFactory.getInstance()
        return LogConfigTypeFactory.instance
end


function LogConfigTypeFactory.new()
    local self = setmetatable({}, LogConfigTypeFactory)
    self:_init_fields()
        LogConfigTypes.LOGGING:add(self.INIT_SERVER)
    return self
end

LogConfigTypeFactory.instance = LogConfigTypeFactory.new()

return LogConfigTypeFactory

