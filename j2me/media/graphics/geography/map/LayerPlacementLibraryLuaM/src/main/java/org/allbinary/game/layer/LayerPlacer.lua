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

local LayerPlacer = {}
package.loaded["org.allbinary.game.layer.LayerPlacer"] = LayerPlacer

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

local Enumeration = java_lazy("java.util.Enumeration")
local GPoint = java_lazy("org.allbinary.graphics.GPoint")
local PointFactory = java_lazy("org.allbinary.graphics.PointFactory")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local LayerInterfaceFactory = java_lazy("org.allbinary.layer.LayerInterfaceFactory")
local LayerInterfaceVisitor = java_lazy("org.allbinary.layer.LayerInterfaceVisitor")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local EnumerationUtil = java_lazy("org.allbinary.util.EnumerationUtil")
local LayerPlacementInterface = java_lazy("org.allbinary.game.layer.LayerPlacementInterface")
local LayerPlacementType = java_lazy("org.allbinary.game.layer.LayerPlacementType")
local LayerPlacementTypeFactory = java_lazy("org.allbinary.game.layer.LayerPlacementTypeFactory")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table LayerPlacer is declared before the requires
LayerPlacer.__index = LayerPlacer
LayerPlacer.className = "LayerPlacer"
LayerPlacer.javaClassName = "org.allbinary.game.layer.LayerPlacer"

function LayerPlacer:_init_fields()
    self.enumerationUtil = EnumerationUtil.getInstance()
    if self.layerInterfaceVisitor == nil then self.layerInterfaceVisitor = nil end
    if self.dimension == nil then self.dimension = nil end
end


function LayerPlacer._jinit(self, layerInterfaceVisitor, dimension)
    LayerPlacer._init_fields(self)
        self.layerInterfaceVisitor = layerInterfaceVisitor
        self.dimension = dimension
    return self
end

function LayerPlacer.new(...)
    local self = setmetatable({}, LayerPlacer)
    LayerPlacer._jinit(self, ...)
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
            error(require("java.lang.Exception").new("PlacementType Not Recognized"), 0)
        end
end

return LayerPlacer

