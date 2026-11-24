-- Generated Code Do Not Modify
-- package org.allbinary.media.graphics.geography.map.racetrack

local AllBinaryTiledLayerFactoryInterface = {}
package.loaded["org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface"] = AllBinaryTiledLayerFactoryInterface

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local RaceTrackData = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData")
local RaceTrackInfo = java_lazy("org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
-- class table AllBinaryTiledLayerFactoryInterface is declared before the requires
AllBinaryTiledLayerFactoryInterface.__index = AllBinaryTiledLayerFactoryInterface
AllBinaryTiledLayerFactoryInterface.className = "AllBinaryTiledLayerFactoryInterface"
AllBinaryTiledLayerFactoryInterface.javaClassName = "org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface"


-- throws Exception
function AllBinaryTiledLayerFactoryInterface:getInstance(raceTrackInfo, raceTrackData)
    error("abstract method getInstance")
end


-- throws Exception
function AllBinaryTiledLayerFactoryInterface:getMiniInstance(raceTrackData)
    error("abstract method getMiniInstance")
end

return AllBinaryTiledLayerFactoryInterface

