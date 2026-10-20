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
-- package org.allbinary.game.layer

-- local Enumeration = require("java.util.Enumeration")
local GPoint = require("org.allbinary.graphics.GPoint")
local PointFactory = require("org.allbinary.graphics.PointFactory")
local AllBinaryLayer = require("org.allbinary.layer.AllBinaryLayer")
local LayerInterfaceFactory = require("org.allbinary.layer.LayerInterfaceFactory")
local LayerInterfaceVisitor = require("org.allbinary.layer.LayerInterfaceVisitor")
local ABHashtable = require("org.allbinary.util.ABHashtable")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local EnumerationUtil = require("org.allbinary.util.EnumerationUtil")

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

local LayerPlacer = {}
LayerPlacer.__index = LayerPlacer
LayerPlacer.className = "LayerPlacer"

function LayerPlacer:_init_fields()
    self.enumerationUtil = EnumerationUtil.getInstance()
    self.layerInterfaceVisitor = nil
    self.dimension = nil
end


function LayerPlacer.new(layerInterfaceVisitor, dimension)
    local self = setmetatable({}, LayerPlacer)
    self:_init_fields()
        self.layerInterfaceVisitor = layerInterfaceVisitor
        self.dimension = dimension
    return self
end


-- throws Exception
function LayerPlacer:processList(list)
        local size = list:size()
        local layerPlacementInterface = nil
        for index = 0, size - 1 do
            layerPlacementInterface = list.objectArray[index + 1]
            self:process(layerPlacementInterface)
        end
end


-- throws Exception
function LayerPlacer:process(layerPlacementInterface)
        local relativePoint = self:getPoint(layerPlacementInterface)
        local layerInterfaceFactory = LayerInterfaceFactory.getInstance()
        local hashtable = layerPlacementInterface:getInstance()
        local enumeration = hashtable:keys()
        local point = nil
        local layerHashtable = nil
        local x = 0
        local y = 0
        local z = 0
        local layerInterface = nil
        while self.enumerationUtil:hasMoreElements(enumeration) do
            point = self.enumerationUtil:nextElement(enumeration)
            layerHashtable = hashtable:get(point)
            x = point:getX() + relativePoint:getX()
            y = point:getY() + relativePoint:getY()
            z = point:getZ() + relativePoint:getZ()
            layerInterface = layerInterfaceFactory:getNexInstance(layerHashtable, x, y, z)
            self.layerInterfaceVisitor:visit(layerInterface)
        end
end


-- throws Exception
function LayerPlacer:getPoint(layerPlacementInterface)
        local pointFactory = PointFactory.getInstance()
        local layerPlacementType = layerPlacementInterface:getLayerType()
        if layerPlacementType == LayerPlacementTypeFactory.getInstance().MAP then
            local width = layerPlacementInterface:getWidth()
            local height = layerPlacementInterface:getHeight()
            local x = ((self.dimension:getX() - width) / 2)
            local y = ((self.dimension:getY() - height) / 2)
            return pointFactory:createXY(x, y)
        elseif layerPlacementType == LayerPlacementTypeFactory.getInstance().UP then
            local width = layerPlacementInterface:getWidth()
            local height = layerPlacementInterface:getHeight()
            local x = ((self.dimension:getX() - width) / 2)
            local y = -height
            return pointFactory:createXY(x, y)
        else
            error(java_exception("Exception", "PlacementType Not Recognized"), 0)
        end
end

return LayerPlacer

