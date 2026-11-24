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
-- package org.allbinary.game.view

local TileLayerPositionIntoViewPositionUtil = {}
package.loaded["org.allbinary.game.view.TileLayerPositionIntoViewPositionUtil"] = TileLayerPositionIntoViewPositionUtil

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

local TileLayerPositionIntoViewPosition = java_lazy("org.allbinary.game.view.TileLayerPositionIntoViewPosition")
local AllBinaryGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCompositeInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")

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

-- class table TileLayerPositionIntoViewPositionUtil is declared before the requires
TileLayerPositionIntoViewPositionUtil.__index = TileLayerPositionIntoViewPositionUtil
TileLayerPositionIntoViewPositionUtil.className = "TileLayerPositionIntoViewPositionUtil"
TileLayerPositionIntoViewPositionUtil.javaClassName = "org.allbinary.game.view.TileLayerPositionIntoViewPositionUtil"

function TileLayerPositionIntoViewPositionUtil._jinit(self)
    return self
end

function TileLayerPositionIntoViewPositionUtil.new()
    return TileLayerPositionIntoViewPositionUtil._jinit(setmetatable({}, TileLayerPositionIntoViewPositionUtil))
end


function TileLayerPositionIntoViewPositionUtil.init(gameCanvasInterface, viewPosition)
        local geographicMapCompositeInterface = gameCanvasInterface:getLayerManager()
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        local tiledLayer = geographicMapInterface:getAllBinaryTiledLayer()
        viewPosition:setTiledLayer(tiledLayer)
end

return TileLayerPositionIntoViewPositionUtil

