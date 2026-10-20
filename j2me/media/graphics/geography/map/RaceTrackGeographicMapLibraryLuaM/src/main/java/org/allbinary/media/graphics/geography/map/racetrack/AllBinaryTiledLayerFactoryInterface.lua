-- Generated Code Do Not Modify
-- package org.allbinary.media.graphics.geography.map.racetrack

local AllBinaryTiledLayer = require("org.allbinary.game.layer.AllBinaryTiledLayer")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local AllBinaryTiledLayerFactoryInterface = {}
AllBinaryTiledLayerFactoryInterface.__index = AllBinaryTiledLayerFactoryInterface
AllBinaryTiledLayerFactoryInterface.className = "AllBinaryTiledLayerFactoryInterface"


-- throws Exception
function AllBinaryTiledLayerFactoryInterface:getInstance(raceTrackInfo, raceTrackData)
    error("abstract method getInstance")
end


-- throws Exception
function AllBinaryTiledLayerFactoryInterface:getMiniInstance(raceTrackData)
    error("abstract method getMiniInstance")
end

return AllBinaryTiledLayerFactoryInterface

