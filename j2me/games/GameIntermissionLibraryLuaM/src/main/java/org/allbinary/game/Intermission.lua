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
-- package org.allbinary.game

local TimeDelayHelper = require("org.allbinary.time.TimeDelayHelper")
local IntermissionInterface = require("org.allbinary.game.IntermissionInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Intermission = {}
Intermission.__index = Intermission
Intermission.className = "Intermission"

function Intermission:_init_fields()
    self.enabled = false
    self.timeElapsedHelper = TimeDelayHelper.new(0)
    self.intermissionEnableListener = NullIntermissionEnableListener.getInstance()
end


function Intermission.new()
    local self = setmetatable({}, Intermission)
    self:_init_fields()
    return self
end


function Intermission:setListener(enableListener)
        self.intermissionEnableListener = enableListener
end


function Intermission:getTimeDelayHelper()
        return self.timeElapsedHelper
end


function Intermission:setEnabled(enabled)
        self.enabled = enabled
        if self:isEnabled() then
            self:getTimeDelayHelper():setStartTimeTNT()
        end
        self.intermissionEnableListener:notifyIntermission(enabled)
end


function Intermission:isEnabled()
        return self.enabled
end

return Intermission

