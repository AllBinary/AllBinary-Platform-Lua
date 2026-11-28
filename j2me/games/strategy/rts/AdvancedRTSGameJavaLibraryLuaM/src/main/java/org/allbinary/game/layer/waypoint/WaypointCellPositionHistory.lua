-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2006 AllBinary 
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
-- package org.allbinary.game.layer.waypoint

local WaypointCellPositionHistory = {}
package.loaded["org.allbinary.game.layer.waypoint.WaypointCellPositionHistory"] = WaypointCellPositionHistory

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

local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local CellPosition = java_lazy("org.allbinary.graphics.CellPosition")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")

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

-- class table WaypointCellPositionHistory is declared before the requires
WaypointCellPositionHistory.__index = WaypointCellPositionHistory
WaypointCellPositionHistory.className = "WaypointCellPositionHistory"
WaypointCellPositionHistory.javaClassName = "org.allbinary.game.layer.waypoint.WaypointCellPositionHistory"

function WaypointCellPositionHistory:_init_fields()
    self.positionList = BasicArrayListD.new()
    self.layerList = BasicArrayListD.new()
end

function WaypointCellPositionHistory._jinit(self)
    WaypointCellPositionHistory._init_fields(self)
    return self
end

function WaypointCellPositionHistory.new()
    return WaypointCellPositionHistory._jinit(setmetatable({}, WaypointCellPositionHistory))
end


function WaypointCellPositionHistory.getInstance()
        return WaypointCellPositionHistory.SINGLETON
end


function WaypointCellPositionHistory:add(cellPosition, layerInterface)
        self.positionList:add(cellPosition)
        self.layerList:add(layerInterface)
end


function WaypointCellPositionHistory:addList(list, layerInterface)
        for index = list:size() - 1, 0, -1 do
            self:add(list:get(index), layerInterface)
        end
end


function WaypointCellPositionHistory:remove(cellPosition)
        local index = self.positionList:indexOf(cellPosition)
        if index >= 0 then
            self.positionList:removeAt(index)
            self.layerList:removeAt(index)
        end
end


function WaypointCellPositionHistory:removeLayer(layerInterface)
        local index = 0
        while not rawequal(index, -1) do
            index = self.layerList:indexOf(layerInterface)
            if index >= 0 then
                self.positionList:removeAt(index)
                self.layerList:removeAt(index)
            end
        end
end


function WaypointCellPositionHistory:clear()
        self.positionList:clear()
        self.layerList:clear()
end


function WaypointCellPositionHistory:isCellPositionWithDrop(cellPosition)
        return self.positionList:contains(cellPosition)
end


function WaypointCellPositionHistory:anyCellPositionWithDrop(list)
        for index = list:size() - 1, 0, -1 do
            if self:isCellPositionWithDrop(list:get(index)) then
                return true
            end
        end
        return false
end


function WaypointCellPositionHistory:getLayerInterface(cellPosition)
        local index = self.positionList:indexOf(cellPosition)
        if index >= 0 then
            return self.layerList:get(index)
        else
            return AllBinaryLayer.NULL_ALLBINARY_LAYER
        end
end

WaypointCellPositionHistory.SINGLETON = WaypointCellPositionHistory.new()

return WaypointCellPositionHistory

