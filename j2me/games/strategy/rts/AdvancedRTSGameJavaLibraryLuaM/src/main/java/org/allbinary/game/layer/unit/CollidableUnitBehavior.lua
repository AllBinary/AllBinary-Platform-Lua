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
-- package org.allbinary.game.layer.unit

local CollidableUnitBehavior = {}
package.loaded["org.allbinary.game.layer.unit.CollidableUnitBehavior"] = CollidableUnitBehavior

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

local Canvas = java_lazy("javax.microedition.lcdui.Canvas")
local SteeringVisitor = require("org.allbinary.game.layer.SteeringVisitor")
local AdvancedRTSGameLayer = java_lazy("org.allbinary.game.layer.AdvancedRTSGameLayer")
local CollidableCompositeLayer = java_lazy("org.allbinary.game.layer.CollidableCompositeLayer")
local CollidableRTSBehavior = require("org.allbinary.game.layer.CollidableRTSBehavior")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local GameKeyEventFactory = java_lazy("org.allbinary.game.input.event.GameKeyEventFactory")
local AllBinaryTiledLayer = java_lazy("org.allbinary.game.layer.AllBinaryTiledLayer")
local TiledLayerUtil = java_lazy("org.allbinary.game.layer.TiledLayerUtil")
local LayerPartialCellPositionsUtil = java_lazy("org.allbinary.game.layer.geographic.map.LayerPartialCellPositionsUtil")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local BooleanFactory = java_lazy("org.allbinary.logic.java.bool.BooleanFactory")
local AngleInfo = java_lazy("org.allbinary.math.AngleInfo")
local BasicGeographicMap = java_lazy("org.allbinary.media.graphics.geography.map.BasicGeographicMap")
local GeographicMapCompositeInterface = java_lazy("org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface")
local DropCellPositionHistory = java_lazy("org.allbinary.media.graphics.geography.map.drop.DropCellPositionHistory")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local UnitLayer = java_lazy("org.allbinary.game.layer.unit.UnitLayer")

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

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table CollidableUnitBehavior is declared before the requires
CollidableUnitBehavior.__index = CollidableUnitBehavior
CollidableUnitBehavior.className = "CollidableUnitBehavior"
CollidableUnitBehavior.javaClassName = "org.allbinary.game.layer.unit.CollidableUnitBehavior"
setmetatable(CollidableUnitBehavior, {__index = CollidableRTSBehavior})
local SimpleSteeringVisitor = {}
    SimpleSteeringVisitor.__index = SimpleSteeringVisitor
    SimpleSteeringVisitor.className = "SimpleSteeringVisitor"
    SimpleSteeringVisitor.javaClassName = "org.allbinary.game.layer.unit.CollidableUnitBehavior$SimpleSteeringVisitor"
    setmetatable(SimpleSteeringVisitor, {__index = SteeringVisitor})
    CollidableUnitBehavior.SimpleSteeringVisitor = SimpleSteeringVisitor

    function SimpleSteeringVisitor._jinit(self)
        java_super_init(SteeringVisitor, self)
        return self
    end

    function SimpleSteeringVisitor.new()
        return SimpleSteeringVisitor._jinit(setmetatable({}, SimpleSteeringVisitor))
    end
    function SimpleSteeringVisitor.newEnclosed(outer)
        return SimpleSteeringVisitor._jinit(setmetatable({__javaOuter = outer}, SimpleSteeringVisitor))
    end
    

    function SimpleSteeringVisitor:visit(anyType)
            local logUtil = LogUtil.getInstance()
            local try_ok, try_error, try_value = pcall(function()
                local ownerLayer = anyType
                if self:getList():size() > 0 then
                    local allbinaryLayer = self:getList():get(0)
                    local clear = self.__javaOuter:steer(ownerLayer, allbinaryLayer)
                    if clear then
                        self:getList():clear()
                        do return "__jreturn", NullUtil.getInstance().NULL_OBJECT end
                    end
                    do return "__jreturn", BooleanFactory.getInstance().TRUE end
                end
                do return "__jreturn", NullUtil.getInstance().NULL_OBJECT end
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                local commonStrings = CommonStrings.getInstance()
                logUtil:put(commonStrings.EXCEPTION, self, "visit", e)
                return NullUtil.getInstance().NULL_OBJECT
            end
            if try_ok and try_error == "__jreturn" then return try_value end
    end
    java_overload(SimpleSteeringVisitor, "visit", 1)


function CollidableUnitBehavior:_init_fields()
    self.layerPartialCellPositionsUtil = LayerPartialCellPositionsUtil.getInstance()
    self.simpleSteeringVisitor = SimpleSteeringVisitor.newEnclosed(self)
end


function CollidableUnitBehavior._jinit(self, collidable)
    java_super_init(CollidableRTSBehavior, self, collidable)
    CollidableUnitBehavior._init_fields(self)
        -- super(...) made self above
    return self
end

function CollidableUnitBehavior.new(...)
    local self = setmetatable({}, CollidableUnitBehavior)
    CollidableUnitBehavior._jinit(self, ...)
    return self
end


-- throws Exception
function CollidableUnitBehavior:collideNone(ownerLayer, collidableInterfaceCompositeInterface)
        self:chase(ownerLayer, collidableInterfaceCompositeInterface)
        local rtsLayer = collidableInterfaceCompositeInterface
        if rawequal(rtsLayer:getType(), UnitLayer.getStaticType()) then
            self:collideUnit(ownerLayer, rtsLayer)
        end
end
java_overload(CollidableUnitBehavior, "collideNone", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "CollidableCompositeLayer")) and (java_a2 == nil or java_is(java_a2, "CollidableCompositeLayer")) end)


-- throws Exception
function CollidableUnitBehavior:steer(ownerLayer, collidableInterfaceCompositeInterface)
        local ownerUnitLayer = ownerLayer
        local unitLayer = collidableInterfaceCompositeInterface
        local angleInfo2 = unitLayer:getRotationAnimationInterface():getAngleInfoP()
        local angleInfo = ownerUnitLayer:getRotationAnimationInterface():getAngleInfoP()
        local angle = angleInfo:getAngle() - angleInfo2:getAngle()
        if angle < 90 or angle > 270 then
            return true
        elseif angle >= 90 or angle <= 270 then
            ownerUnitLayer:getGameKeyEventList():add(GameKeyEventFactory.getInstance():getInstanceForKey(ownerUnitLayer, Canvas.RIGHT))
            return false
        end
        error(require("java.lang.Exception").new("Error"), 0)
end
java_overload(CollidableUnitBehavior, "steer", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "CollidableCompositeLayer")) and (java_a2 == nil or java_is(java_a2, "CollidableCompositeLayer")) end)


-- throws Exception
function CollidableUnitBehavior:chase(ownerLayer, collidableInterfaceCompositeInterface)
        local rtsLayer = collidableInterfaceCompositeInterface
        if rawequal(rtsLayer:getType(), UnitLayer.getStaticType()) then
            if not (self.simpleSteeringVisitor:getList():contains(collidableInterfaceCompositeInterface)) then
                self.simpleSteeringVisitor:getList():add(collidableInterfaceCompositeInterface)
            end
            local ownerUnitLayer = ownerLayer
            local list = ownerUnitLayer:getUnitWaypointBehavior():getSteeringVisitorList()
            if not (list:contains(self.simpleSteeringVisitor)) then
                list:add(self.simpleSteeringVisitor)
            end
        end
end
java_overload(CollidableUnitBehavior, "chase", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "CollidableCompositeLayer")) and (java_a2 == nil or java_is(java_a2, "CollidableCompositeLayer")) end)


-- throws Exception
function CollidableUnitBehavior:collideUnit(ownerLayer, unitLayer)
        local ownerUnitLayer = ownerLayer
        local partialPositionList = UnitLayer.getPartialpositionlist()
        local geographicMapCompositeInterface = ownerUnitLayer.allBinaryGameLayerManagerP
        local geographicMapInterface = geographicMapCompositeInterface:getGeographicMapInterface()[1]
        local basicGeographicMap = geographicMapInterface
        local dropCellPositionHistory = DropCellPositionHistory.getInstance()
        local tiledLayerUtil = TiledLayerUtil.getInstance()
        local tiledLayer = basicGeographicMap:getAllBinaryTiledLayer()
        if ownerLayer:getXP() < unitLayer:getXP() and ownerLayer:getX2() > unitLayer:getXP() then
            local diff = ownerLayer:getWidth() + 1
            self.layerPartialCellPositionsUtil:getAllDXY(basicGeographicMap, ownerLayer, -diff, 0, partialPositionList)
            if not (dropCellPositionHistory:anyCellPositionWithDrop(partialPositionList)) then
                local x = unitLayer:getXP() - diff
                local y = ownerLayer:getYP()
                x = tiledLayerUtil:keepOnMapX(tiledLayer, x, ownerLayer:getWidth())
                y = tiledLayerUtil:keepOnMapY(tiledLayer, y, ownerLayer:getHeight())
                ownerLayer:setPosition(x, y, ownerLayer:getZP())
            end
            self.layerPartialCellPositionsUtil:getAllDXY(basicGeographicMap, unitLayer, diff, 0, partialPositionList)
            if not (dropCellPositionHistory:anyCellPositionWithDrop(partialPositionList)) then
                local x = unitLayer:getXP() + diff
                local y = unitLayer:getYP()
                x = tiledLayerUtil:keepOnMapX(tiledLayer, x, unitLayer:getWidth())
                y = tiledLayerUtil:keepOnMapY(tiledLayer, y, unitLayer:getHeight())
                unitLayer:setPosition(x, y, unitLayer:getZP())
            end
        end
        if ownerLayer:getYP() < unitLayer:getYP() and ownerLayer:getY2() > unitLayer:getYP() then
            local diff = ownerLayer:getHeight() + 1
            self.layerPartialCellPositionsUtil:getAllDXY(basicGeographicMap, ownerLayer, 0, -diff, partialPositionList)
            if not (dropCellPositionHistory:anyCellPositionWithDrop(partialPositionList)) then
                local x = ownerLayer:getXP()
                local y = unitLayer:getYP() - diff
                x = tiledLayerUtil:keepOnMapX(tiledLayer, x, ownerLayer:getWidth())
                y = tiledLayerUtil:keepOnMapY(tiledLayer, y, ownerLayer:getHeight())
                ownerLayer:setPosition(x, y, ownerLayer:getZP())
            end
            self.layerPartialCellPositionsUtil:getAllDXY(basicGeographicMap, unitLayer, 0, diff, partialPositionList)
            if not (dropCellPositionHistory:anyCellPositionWithDrop(partialPositionList)) then
                local x = unitLayer:getXP()
                local y = unitLayer:getYP() + diff
                x = tiledLayerUtil:keepOnMapX(tiledLayer, x, unitLayer:getWidth())
                y = tiledLayerUtil:keepOnMapY(tiledLayer, y, unitLayer:getHeight())
                unitLayer:setPosition(x, y, unitLayer:getZP())
            end
        end
end
java_overload(CollidableUnitBehavior, "collideUnit", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "CollidableCompositeLayer")) and (java_a2 == nil or java_is(java_a2, "UnitLayer")) end)

return CollidableUnitBehavior

