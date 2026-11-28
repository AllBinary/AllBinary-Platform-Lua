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
-- package org.allbinary.media.graphics.geography.map

local GeographicMapCellPositionTracking = {}
package.loaded["org.allbinary.media.graphics.geography.map.GeographicMapCellPositionTracking"] = GeographicMapCellPositionTracking

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

local AllBinaryGameCanvasInterface = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvasInterface")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCellPosition = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellPosition")
local GeographicMapCellType = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCellType")
local GeographicMapCompositeInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local SimpleGeographicMapCellPositionFactory = java_lazy("org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory")

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

-- class table GeographicMapCellPositionTracking is declared before the requires
GeographicMapCellPositionTracking.__index = GeographicMapCellPositionTracking
GeographicMapCellPositionTracking.className = "GeographicMapCellPositionTracking"
GeographicMapCellPositionTracking.javaClassName = "org.allbinary.media.graphics.geography.map.GeographicMapCellPositionTracking"

function GeographicMapCellPositionTracking:_init_fields()
    self.currentGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.previousGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.newGeographicMapCellPosition = SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
    self.currentCellType = GeographicMapCellType.NULL_GEOGRAPHIC_MAP_CELL_TYPE
end


function GeographicMapCellPositionTracking._jinit(self)
    GeographicMapCellPositionTracking._init_fields(self)
    return self
end

function GeographicMapCellPositionTracking.new(...)
    local self = setmetatable({}, GeographicMapCellPositionTracking)
    GeographicMapCellPositionTracking._jinit(self, ...)
    return self
end


-- throws Exception
function GeographicMapCellPositionTracking:getCurrentOverCellType(geographicMap)
        local geographicMapCellPosition = self.currentGeographicMapCellPosition
        if not rawequal(geographicMapCellPosition, self.previousGeographicMapCellPosition) then
            self.currentCellType = geographicMap:getCellTypeAt(geographicMapCellPosition)
        end
        return self.currentCellType
end


-- throws Exception
function GeographicMapCellPositionTracking:updateStart(gameCanvasInterface, layer)
        if not rawequal(gameCanvasInterface, SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) then
            local geographicMapCompositeInterface = gameCanvasInterface:getLayerManager()
            local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
            self.newGeographicMapCellPosition = geographicMapInterface:getCellPositionAtXY(layer:getXP() + layer:getHalfWidth(), layer:getYP() + layer:getHalfHeight())
            if not rawequal(self.newGeographicMapCellPosition, self.currentGeographicMapCellPosition) then
                self.currentGeographicMapCellPosition = self.newGeographicMapCellPosition
                return true
            end
        end
        return false
end


function GeographicMapCellPositionTracking:updateEnd()
        if not rawequal(self.currentGeographicMapCellPosition, self.previousGeographicMapCellPosition) then
            self.previousGeographicMapCellPosition = self.currentGeographicMapCellPosition
            return true
        end
        return false
end


function GeographicMapCellPositionTracking:getPreviousGeographicMapCellPosition()
        return self.previousGeographicMapCellPosition
end


function GeographicMapCellPositionTracking:getCurrentGeographicMapCellPosition()
        return self.currentGeographicMapCellPosition
end

return GeographicMapCellPositionTracking

