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
-- package org.allbinary.media.graphics.geography.map.racetrack.threed

local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")
local RaceTrackData = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData")
local RaceTrackInfo = require("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AllBinaryThreedTiledLayerFactory = {}
AllBinaryThreedTiledLayerFactory.__index = AllBinaryThreedTiledLayerFactory
AllBinaryThreedTiledLayerFactory.className = "AllBinaryThreedTiledLayerFactory"

function AllBinaryThreedTiledLayerFactory.new()
    local self = setmetatable({}, AllBinaryThreedTiledLayerFactory)
    return self
end


function AllBinaryThreedTiledLayerFactory.getInstance()
        return AllBinaryThreedTiledLayerFactory.instance
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function AllBinaryThreedTiledLayerFactory:getInstance(raceTrackInfo, raceTrackData)
        error(java_exception("Exception", "No Threed"), 0)
end

AllBinaryThreedTiledLayerFactory.instance = AllBinaryThreedTiledLayerFactory.new()

return AllBinaryThreedTiledLayerFactory

