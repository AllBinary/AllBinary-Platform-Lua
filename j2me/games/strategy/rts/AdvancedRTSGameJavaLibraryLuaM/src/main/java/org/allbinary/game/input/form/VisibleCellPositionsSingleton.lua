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
-- package org.allbinary.game.input.form

local VisibleCellPositionsSingleton = {}
package.loaded["org.allbinary.game.input.form.VisibleCellPositionsSingleton"] = VisibleCellPositionsSingleton

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

local SimpleTiledLayer = java_lazy("javax.microedition.lcdui.game.SimpleTiledLayer")
local Graphics = java_lazy("javax.microedition.lcdui.Graphics")
local RTSLayerEvent = java_lazy("org.allbinary.game.layer.RTSLayerEvent")
local BuildingEventListenerInterface = java_lazy("org.allbinary.game.layer.building.event.BuildingEventListenerInterface")
local LocalPlayerBuildingEventHandler = java_lazy("org.allbinary.game.layer.building.event.LocalPlayerBuildingEventHandler")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local CellPosition = java_lazy("org.allbinary.graphics.CellPosition")
local ScrollMapEvent = java_lazy("org.allbinary.layer.event.ScrollMapEvent")
local ScrollMapEventHandler = java_lazy("org.allbinary.layer.event.ScrollMapEventHandler")
local ScrollMapEventListenerInterface = java_lazy("org.allbinary.layer.event.ScrollMapEventListenerInterface")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

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

-- class table VisibleCellPositionsSingleton is declared before the requires
VisibleCellPositionsSingleton.__index = VisibleCellPositionsSingleton
VisibleCellPositionsSingleton.className = "VisibleCellPositionsSingleton"
VisibleCellPositionsSingleton.javaClassName = "org.allbinary.game.input.form.VisibleCellPositionsSingleton"
VisibleCellPositionsSingleton.java_implements = " BuildingEventListenerInterface ScrollMapEventListenerInterface "
VisibleCellPositionsSingleton.java_interfaces = function() return {BuildingEventListenerInterface, ScrollMapEventListenerInterface} end

function VisibleCellPositionsSingleton:_init_fields()
    self.stationaryVisibleCellPositions = NullUtil.getInstance().NULL_SHORT_ARRAY_ARRAY
    self.visibleCellPositions = NullUtil.getInstance().NULL_SHORT_ARRAY_ARRAY
    self.currentlyVisibleCellPositions = NullUtil.getInstance().NULL_SHORT_ARRAY_ARRAY
    self.ALL_VISIBLE_TILEDLAYER = SimpleTiledLayer.new(0, 0, 0, 0)
    self.simpleTiledLayer = self.ALL_VISIBLE_TILEDLAYER
    self.paintSimpleTiledLayer = self.ALL_VISIBLE_TILEDLAYER
    if self.currentIndex == nil then self.currentIndex = 0 end
end


function VisibleCellPositionsSingleton.getInstance()
        return VisibleCellPositionsSingleton.instance_f
end


function VisibleCellPositionsSingleton._jinit(self)
    VisibleCellPositionsSingleton._init_fields(self)
        LocalPlayerBuildingEventHandler.getInstance():addListenerInterface(self)
        ScrollMapEventHandler.getInstance():addListenerInterface(self)
    return self
end

function VisibleCellPositionsSingleton.new(...)
    local self = setmetatable({}, VisibleCellPositionsSingleton)
    VisibleCellPositionsSingleton._jinit(self, ...)
    return self
end


function VisibleCellPositionsSingleton:init(simpleTiledLayer)
        self.paintSimpleTiledLayer = self.ALL_VISIBLE_TILEDLAYER
        self.currentIndex = 0
        local rows = simpleTiledLayer:getRows()
        local columns = simpleTiledLayer:getColumns()
        self.stationaryVisibleCellPositions = java_new_array(0, rows, columns)
        self.visibleCellPositions = java_new_array(0, rows, columns)
        self.currentlyVisibleCellPositions = java_new_array(0, rows, columns)
        self:setSimpleTiledLayer(simpleTiledLayer)
end


function VisibleCellPositionsSingleton:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


-- throws Exception
function VisibleCellPositionsSingleton:onBuildingEvent(event)
        self.paintSimpleTiledLayer = self.simpleTiledLayer
end


-- throws Exception
function VisibleCellPositionsSingleton:onMoveEvent(scrollMapEvent)
        self:move(scrollMapEvent:getDx(), scrollMapEvent:getDy())
end


function VisibleCellPositionsSingleton:addStationaryCellPositions(list)
        for index = list:size() - 1, 0, -1 do
            local cellPosition = list:get(index)
            self.stationaryVisibleCellPositions[cellPosition:getRow() + 1][cellPosition:getColumn() + 1] = self.stationaryVisibleCellPositions[cellPosition:getRow() + 1][cellPosition:getColumn() + 1] + 1
        end
end


function VisibleCellPositionsSingleton:removeStationaryCellPositions(list)
        for index = list:size() - 1, 0, -1 do
            local cellPosition = list:get(index)
            self.stationaryVisibleCellPositions[cellPosition:getRow() + 1][cellPosition:getColumn() + 1] = self.stationaryVisibleCellPositions[cellPosition:getRow() + 1][cellPosition:getColumn() + 1] - 1
        end
end


function VisibleCellPositionsSingleton:update()
        if rawequal(self.currentIndex, 0) then
            local temp = self.currentlyVisibleCellPositions
            self.currentlyVisibleCellPositions = self.visibleCellPositions
            self.visibleCellPositions = temp
            for index = (self.visibleCellPositions.n or #self.visibleCellPositions) - 1, 0, -1 do
                for index2 = (self.visibleCellPositions[1].n or #self.visibleCellPositions[1]) - 1, 0, -1 do
                    self.visibleCellPositions[index + 1][index2 + 1] = self.stationaryVisibleCellPositions[index + 1][index2 + 1]
                end
            end
        end
        self.currentIndex = self.currentIndex + 1
        if self.currentIndex > 10 then
            self.currentIndex = 0
        end
end


function VisibleCellPositionsSingleton:shouldProcess()
        if rawequal(self.currentIndex, 0) then
            return true
        else
            return false
        end
end


function VisibleCellPositionsSingleton:addCellPositions(list)
        for index = list:size() - 1, 0, -1 do
            local cellPosition = list:get(index)
            self.visibleCellPositions[cellPosition:getRow() + 1][cellPosition:getColumn() + 1] = self.visibleCellPositions[cellPosition:getRow() + 1][cellPosition:getColumn() + 1] + 1
        end
end


function VisibleCellPositionsSingleton:isVisible(cellPosition)
        if self.visibleCellPositions[cellPosition:getRow() + 1][cellPosition:getColumn() + 1] > 0 then
            return true
        else
            return false
        end
end


function VisibleCellPositionsSingleton:move(dx, dy)
        self:getSimpleTiledLayer():moveDXY(dx, dy)
end


function VisibleCellPositionsSingleton:paint(graphics)
        self.paintSimpleTiledLayer:paint(graphics, self.currentlyVisibleCellPositions)
end


function VisibleCellPositionsSingleton:setSimpleTiledLayer(simpleTiledLayer)
        self.simpleTiledLayer = simpleTiledLayer
end


function VisibleCellPositionsSingleton:getSimpleTiledLayer()
        return self.simpleTiledLayer
end

VisibleCellPositionsSingleton.instance_f = VisibleCellPositionsSingleton.new()

return VisibleCellPositionsSingleton

