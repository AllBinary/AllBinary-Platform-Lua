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
-- package org.allbinary.game.ag.ai.scroller

local PacePatrolAI = {}
package.loaded["org.allbinary.game.ag.ai.scroller.PacePatrolAI"] = PacePatrolAI

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
local Direction = java_lazy("org.allbinary.direction.Direction")
local DirectionCompositeInterface = java_lazy("org.allbinary.direction.DirectionCompositeInterface")
local DirectionFactory = java_lazy("org.allbinary.direction.DirectionFactory")
local GameInput = java_lazy("org.allbinary.game.input.GameInput")
local TrackingEvent = java_lazy("org.allbinary.game.tracking.TrackingEvent")
local TrackingEventHandler = java_lazy("org.allbinary.game.tracking.TrackingEventHandler")
local TrackingEventListenerInterface = java_lazy("org.allbinary.game.tracking.TrackingEventListenerInterface")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local LayerInterface = java_lazy("org.allbinary.layer.LayerInterface")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local BasePatrolAI = require("org.allbinary.game.ag.ai.scroller.BasePatrolAI")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table PacePatrolAI is declared before the requires
PacePatrolAI.__index = PacePatrolAI
PacePatrolAI.className = "PacePatrolAI"
PacePatrolAI.javaClassName = "org.allbinary.game.ag.ai.scroller.PacePatrolAI"
setmetatable(PacePatrolAI, {__index = BasePatrolAI})
PacePatrolAI.java_implements = " TrackingEventListenerInterface "
PacePatrolAI.java_interfaces = function() return {TrackingEventListenerInterface} end

function PacePatrolAI:_init_fields()
    if self.trackingList == nil then self.trackingList = nil end
    if self.firingDistance == nil then self.firingDistance = 0 end
    self.isFollowLimitedByTerrain = false
end


function PacePatrolAI._jinit(self, hashtable, ownerLayerInterface, gameInput)
    java_super_init(BasePatrolAI, self, hashtable, ownerLayerInterface, gameInput)
    PacePatrolAI._init_fields(self)
        -- super(...) made self above
        TrackingEventHandler.getInstance():addListenerInterface(self)
        self.trackingList = BasicArrayListD.new()
    return self
end

function PacePatrolAI.new(...)
    local self = setmetatable({}, PacePatrolAI)
    PacePatrolAI._jinit(self, ...)
    return self
end


-- throws Exception
function PacePatrolAI:processAI(allBinaryLayerManager)
        self:update()
        local direction = self:setFiringDirectionForTargetIfInRange()
        local directionFactory = DirectionFactory.getInstance()
        if rawequal(direction, directionFactory.LEFT) then
            if not rawequal(self.lastKeyDirection, self.keyDirection) or not (self.isFollowLimitedByTerrain) then
                java_super(BasePatrolAI, "processKeyAI", 1)(self, Canvas.LEFT)
            end
            self.keyDirection = Canvas.LEFT
            self.lastKeyDirection = self.keyDirection
            self.xTotalDistance = 0
            java_super(BasePatrolAI, "processKeyAI", 1)(self, Canvas.KEY_NUM1)
        elseif rawequal(direction, directionFactory.RIGHT) then
            if not rawequal(self.lastKeyDirection, self.keyDirection) or not (self.isFollowLimitedByTerrain) then
                java_super(BasePatrolAI, "processKeyAI", 1)(self, Canvas.RIGHT)
            end
            self.keyDirection = Canvas.RIGHT
            self.lastKeyDirection = self.keyDirection
            self.xTotalDistance = 0
            java_super(BasePatrolAI, "processKeyAI", 1)(self, Canvas.KEY_NUM1)
        else
            java_super(BasePatrolAI, "processKeyAI", 1)(self, self.keyDirection)
        end
end
java_overload(PacePatrolAI, "processAI", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function PacePatrolAI:setFiringDirectionForTargetIfInRange()
        local directionFactory = DirectionFactory.getInstance()
        local ownerLayerInterface = self:getOwnerLayerInterface()
        local direction = directionFactory.NOT_BORDERED_WITH
        local lastTrackingEvent = nil
        local lastTrackingLayerInterface = nil
        local directionCompositeInterface = nil
        local size = self.trackingList:size()
        for index = 0, size - 1 do
            lastTrackingEvent = self.trackingList:get(0)
            lastTrackingLayerInterface = lastTrackingEvent:getLayerInterface()
            local x = lastTrackingLayerInterface:getXP()
            local y = lastTrackingLayerInterface:getYP()
            local yDistance = ownerLayerInterface:getYP() - y - ownerLayerInterface:getHeight()
            local xDistance = ownerLayerInterface:getXP() - x - ownerLayerInterface:getWidth()
            local absXDistance = math.abs(xDistance)
            local absYDistance = math.abs(yDistance)
            if absYDistance <= 100 then
                if absXDistance < java_idiv(self:getFiringDistance(), 2) then
                    directionCompositeInterface = self:getOwnerLayerInterface()
                    if xDistance < 0 and rawequal(directionCompositeInterface:getDirection(), directionFactory.RIGHT) then
                        direction = directionFactory.RIGHT
                    elseif xDistance > 0 and rawequal(directionCompositeInterface:getDirection(), directionFactory.LEFT) then
                        direction = directionFactory.LEFT
                    end
                end
            end
        end
        return direction
end
java_overload(PacePatrolAI, "setFiringDirectionForTargetIfInRange", 0)


function PacePatrolAI:disable()
end
java_overload(PacePatrolAI, "disable", 0)


function PacePatrolAI:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end
java_overload(PacePatrolAI, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


function PacePatrolAI:onMovement(trackingEvent)
        self.trackingList:clear()
        self.trackingList:add(trackingEvent)
end
java_overload(PacePatrolAI, "onMovement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "TrackingEvent")) end)


function PacePatrolAI:getFiringDistance()
        return self.firingDistance
end
java_overload(PacePatrolAI, "getFiringDistance", 0)


function PacePatrolAI:setFiringDistance(firingDistance)
        self.firingDistance = firingDistance
end
java_overload(PacePatrolAI, "setFiringDistance", 1, function(java_a1) return true and type(java_a1) == "number" end)

return PacePatrolAI

