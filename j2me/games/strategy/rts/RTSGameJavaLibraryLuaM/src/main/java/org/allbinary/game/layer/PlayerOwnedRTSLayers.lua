-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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
-- package org.allbinary.game.layer

local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PlayerOwnedRTSLayers = {}
PlayerOwnedRTSLayers.__index = PlayerOwnedRTSLayers
PlayerOwnedRTSLayers.className = "PlayerOwnedRTSLayers"

function PlayerOwnedRTSLayers:_init_fields()
    self.rtsLayerList = BasicArrayListD.new()
end

function PlayerOwnedRTSLayers.new()
    local self = setmetatable({}, PlayerOwnedRTSLayers)
    self:_init_fields()
    return self
end


function PlayerOwnedRTSLayers:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("All: ")
        stringBuffer:appendint(self.rtsLayerList:size())
        return tostring(stringBuffer)
end
PlayerOwnedRTSLayers.__tostring = function(self) return self:toString() end

return PlayerOwnedRTSLayers

