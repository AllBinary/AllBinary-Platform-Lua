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
-- package org.allbinary.game.ag.ai

local DiveAndDirectionalTrackingAI = {}
package.loaded["org.allbinary.game.ag.ai.DiveAndDirectionalTrackingAI"] = DiveAndDirectionalTrackingAI

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
local ArtificialIntelligenceInterface = java_lazy("org.allbinary.ai.ArtificialIntelligenceInterface")
local Direction = java_lazy("org.allbinary.direction.Direction")
local DirectionFactory = java_lazy("org.allbinary.direction.DirectionFactory")
local DirectionalCompositeInterface = java_lazy("org.allbinary.direction.DirectionalCompositeInterface")
local DirectionalInterface = java_lazy("org.allbinary.direction.DirectionalInterface")
local BasicAI = require("org.allbinary.game.ai.BasicAI")
local DestroyedEvent = java_lazy("org.allbinary.game.combat.destroy.event.DestroyedEvent")
local DestroyedEventHandler = java_lazy("org.allbinary.game.combat.destroy.event.DestroyedEventHandler")
local DestroyedEventListenerInterface = java_lazy("org.allbinary.game.combat.destroy.event.DestroyedEventListenerInterface")
local Group = java_lazy("org.allbinary.game.identification.Group")
local GameInput = java_lazy("org.allbinary.game.input.GameInput")
local BasicVelocityProperties = java_lazy("org.allbinary.game.physics.velocity.BasicVelocityProperties")
local VelocityInterfaceCompositeInterface = java_lazy("org.allbinary.game.physics.velocity.VelocityInterfaceCompositeInterface")
local TrackingEvent = java_lazy("org.allbinary.game.tracking.TrackingEvent")
local TrackingEventHandler = java_lazy("org.allbinary.game.tracking.TrackingEventHandler")
local TrackingEventListenerInterface = java_lazy("org.allbinary.game.tracking.TrackingEventListenerInterface")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local MathUtil = java_lazy("org.allbinary.logic.math.MathUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local Visitor = java_lazy("org.allbinary.logic.util.visitor.Visitor")
local GameTickTimeDelayHelper = java_lazy("org.allbinary.time.GameTickTimeDelayHelper")
local GameTickTimeDelayHelperFactory = java_lazy("org.allbinary.time.GameTickTimeDelayHelperFactory")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")

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

-- class table DiveAndDirectionalTrackingAI is declared before the requires
DiveAndDirectionalTrackingAI.__index = DiveAndDirectionalTrackingAI
DiveAndDirectionalTrackingAI.className = "DiveAndDirectionalTrackingAI"
DiveAndDirectionalTrackingAI.javaClassName = "org.allbinary.game.ag.ai.DiveAndDirectionalTrackingAI"
setmetatable(DiveAndDirectionalTrackingAI, {__index = BasicAI})
DiveAndDirectionalTrackingAI.java_implements = " TrackingEventListenerInterface DestroyedEventListenerInterface "
DiveAndDirectionalTrackingAI.java_interfaces = function() return {TrackingEventListenerInterface, DestroyedEventListenerInterface} end

function DiveAndDirectionalTrackingAI:_init_fields()
    self.mathUtil = MathUtil.getInstance()
    self.directionFactory = DirectionFactory.getInstance()
    self.gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
    self.timeDelayHelper = TimeDelayHelper.new(500)
    self.list = BasicArrayListD.new()
    if self.directionalInterface == nil then self.directionalInterface = nil end
    if self.velocityInterface == nil then self.velocityInterface = nil end
    self.directionToKeyMap = {jt = "I", Canvas.LEFT, Canvas.DOWN, Canvas.UP, Canvas.RIGHT}
    if self.initialDropped == nil then self.initialDropped = false end
    if self.diveP == nil then self.diveP = false end
    self.directionOfTarget = Direction.getInstance(0)
    self.MIN_DISTANCE = 40
    self.lastTrackingLayerInterface = AllBinaryLayer.NULL_ALLBINARY_LAYER
    if self.artificialIntelligenceInterface == nil then self.artificialIntelligenceInterface = nil end
    if self.aiVistor == nil then self.aiVistor = nil end
    self.lastDirection = DirectionFactory.getInstance().NO_DIRECTION
end


function DiveAndDirectionalTrackingAI._jinit(self, ownerLayerInterface, artificialIntelligenceInterface, gameInput, visitor)
    java_super_init(BasicAI, self, ownerLayerInterface, gameInput)
    DiveAndDirectionalTrackingAI._init_fields(self)
        -- super(...) made self above
        self.aiVistor = visitor
        self.artificialIntelligenceInterface = artificialIntelligenceInterface
        local directionalCompositeInterface = self:getOwnerLayerInterface()
        self.directionalInterface = directionalCompositeInterface:getDirectionalInterface()
        local velocityInterfaceCompositeInterface = self:getOwnerLayerInterface()
        self.velocityInterface = velocityInterfaceCompositeInterface:getVelocityProperties()
        DestroyedEventHandler.getInstance():addListenerInterface(self)
        self:init()
    return self
end

function DiveAndDirectionalTrackingAI.new(...)
    local self = setmetatable({}, DiveAndDirectionalTrackingAI)
    DiveAndDirectionalTrackingAI._jinit(self, ...)
    return self
end


-- throws Exception
function DiveAndDirectionalTrackingAI:processAI(allBinaryLayerManager)
        if self:isBeyondTarget() then
            self:init()
            self.velocityInterface:zero()
        end
        if not (self.diveP) then
            self:target(allBinaryLayerManager)
        else
            self:dive()
            self:attack()
        end
        self.list:clear()
end
java_overload(DiveAndDirectionalTrackingAI, "processAI", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function DiveAndDirectionalTrackingAI:init()
        self.diveP = false
        self.directionOfTarget = DirectionFactory.getInstance().NOT_BORDERED_WITH
        TrackingEventHandler.getInstance():addListenerInterface(self)
end
java_overload(DiveAndDirectionalTrackingAI, "init", 0)


-- throws Exception
function DiveAndDirectionalTrackingAI:target(allBinaryLayerManager)
        if rawequal(self.list:size(), 0) then
            return
        end
        local lastTrackingEvent = self.list:removeAt(0)
        self.lastTrackingLayerInterface = lastTrackingEvent:getLayerInterface()
        local layerInterface = self.lastTrackingLayerInterface
        local ownerLayerInterface = self:getOwnerLayerInterface()
        local groupArray = layerInterface:getGroupInterface()
        local ownerGroupArray = ownerLayerInterface:getGroupInterface()
        if rawequal(groupArray, ownerGroupArray) then
            return
        end
        local x = self.lastTrackingLayerInterface:getXP()
        local y = self.lastTrackingLayerInterface:getYP()
        local yDistance = ownerLayerInterface:getYP() - y - ownerLayerInterface:getHeight()
        local xDistance = ownerLayerInterface:getXP() - x - ownerLayerInterface:getWidth()
        local directionFactory = DirectionFactory.getInstance()
        if self.mathUtil:abs(yDistance) > self.mathUtil:abs(xDistance) then
            if yDistance > self.MIN_DISTANCE then
                self.directionOfTarget = directionFactory.UP
            elseif yDistance < -self.MIN_DISTANCE then
                self.directionOfTarget = directionFactory.DOWN
            end
        else
            if xDistance > self.MIN_DISTANCE then
                self.directionOfTarget = directionFactory.LEFT
            elseif xDistance < -self.MIN_DISTANCE then
                self.directionOfTarget = directionFactory.RIGHT
            end
        end
        if not (self.initialDropped) and not rawequal(self.directionOfTarget, directionFactory.NOT_BORDERED_WITH) then
            self:drop()
        end
        if self.initialDropped then
            if rawequal(self.directionOfTarget, directionFactory.UP) or rawequal(self.directionOfTarget, directionFactory.DOWN) then
                self:verticalTargeting(x)
            elseif rawequal(self.directionOfTarget, directionFactory.LEFT) or rawequal(self.directionOfTarget, directionFactory.RIGHT) then
                self:horizontalTargeting(y)
            else
                self.artificialIntelligenceInterface:processAI(allBinaryLayerManager)
            end
        end
end
java_overload(DiveAndDirectionalTrackingAI, "target", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


-- throws Exception
function DiveAndDirectionalTrackingAI:verticalTargeting(x)
        local ownerLayerInterface = self:getOwnerLayerInterface()
        if ownerLayerInterface:getXP() < x then
            self:moveRight()
        end
        if ownerLayerInterface:getXP() > x then
            self:moveLeft()
        end
        if ownerLayerInterface:getXP() > x - 3 and ownerLayerInterface:getXP() < x + 3 then
            self:setDive()
        end
end
java_overload(DiveAndDirectionalTrackingAI, "verticalTargeting", 1, function(java_a1) return true and type(java_a1) == "number" end)


-- throws Exception
function DiveAndDirectionalTrackingAI:horizontalTargeting(y)
        local ownerLayerInterface = self:getOwnerLayerInterface()
        if ownerLayerInterface:getYP() < y then
            self:moveDown()
        end
        if ownerLayerInterface:getYP() > y then
            self:moveUp()
        end
        if ownerLayerInterface:getYP() > y - 3 and ownerLayerInterface:getYP() < y + 3 then
            self:setDive()
        end
end
java_overload(DiveAndDirectionalTrackingAI, "horizontalTargeting", 1, function(java_a1) return true and type(java_a1) == "number" end)


function DiveAndDirectionalTrackingAI:setDive()
        self.diveP = true
        self.velocityInterface:zero()
        TrackingEventHandler.getInstance():removeListener(self)
end
java_overload(DiveAndDirectionalTrackingAI, "setDive", 0)


-- throws Exception
function DiveAndDirectionalTrackingAI:moveRight()
        self:setLastDirection(self.directionFactory.RIGHT)
        self.directionalInterface:setFrameByDirection(self.lastDirection)
        self.aiVistor:visit(self)
end
java_overload(DiveAndDirectionalTrackingAI, "moveRight", 0)


-- throws Exception
function DiveAndDirectionalTrackingAI:moveLeft()
        self:setLastDirection(self.directionFactory.LEFT)
        self.directionalInterface:setFrameByDirection(self.lastDirection)
        self.aiVistor:visit(self)
end
java_overload(DiveAndDirectionalTrackingAI, "moveLeft", 0)


-- throws Exception
function DiveAndDirectionalTrackingAI:moveDown()
        self:setLastDirection(self.directionFactory.DOWN)
        self.directionalInterface:setFrameByDirection(self.lastDirection)
        self.aiVistor:visit(self)
end
java_overload(DiveAndDirectionalTrackingAI, "moveDown", 0)


-- throws Exception
function DiveAndDirectionalTrackingAI:moveUp()
        self:setLastDirection(self.directionFactory.UP)
        self.directionalInterface:setFrameByDirection(self.lastDirection)
        self.aiVistor:visit(self)
end
java_overload(DiveAndDirectionalTrackingAI, "moveUp", 0)


-- throws Exception
function DiveAndDirectionalTrackingAI:dive()
        self.directionalInterface:setFrameByDirection(self.directionOfTarget)
        self.aiVistor:visit(self)
end
java_overload(DiveAndDirectionalTrackingAI, "dive", 0)


-- throws Exception
function DiveAndDirectionalTrackingAI:attack()
        java_super(BasicAI, "processKeyAI", 1)(self, Canvas.KEY_NUM1)
end
java_overload(DiveAndDirectionalTrackingAI, "attack", 0)


-- throws Exception
function DiveAndDirectionalTrackingAI:drop()
        if self.timeDelayHelper:isTime(self.gameTickTimeDelayHelper.startTime) then
            self.initialDropped = true
            self.aiVistor:visit(self)
        end
end
java_overload(DiveAndDirectionalTrackingAI, "drop", 0)


function DiveAndDirectionalTrackingAI:isBeyondTarget()
        if rawequal(self.directionOfTarget, self.directionFactory.DOWN) then
            if self:getOwnerLayerInterface():getYP() > self.lastTrackingLayerInterface:getYP() + self.MIN_DISTANCE then
                return true
            else
                return false
            end
        elseif rawequal(self.directionOfTarget, self.directionFactory.UP) then
            if self:getOwnerLayerInterface():getYP() < self.lastTrackingLayerInterface:getYP() + self.MIN_DISTANCE then
                return true
            else
                return false
            end
        elseif rawequal(self.directionOfTarget, self.directionFactory.RIGHT) then
            if self:getOwnerLayerInterface():getXP() > self.lastTrackingLayerInterface:getXP() + self.MIN_DISTANCE then
                return true
            else
                return false
            end
        elseif rawequal(self.directionOfTarget, self.directionFactory.LEFT) then
            if self:getOwnerLayerInterface():getXP() < self.lastTrackingLayerInterface:getXP() + self.MIN_DISTANCE then
                return true
            else
                return false
            end
        else
            return false
        end
end
java_overload(DiveAndDirectionalTrackingAI, "isBeyondTarget", 0)


function DiveAndDirectionalTrackingAI:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end
java_overload(DiveAndDirectionalTrackingAI, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


function DiveAndDirectionalTrackingAI:onMovement(trackingEvent)
        self.list:add(trackingEvent)
end
java_overload(DiveAndDirectionalTrackingAI, "onMovement", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "TrackingEvent")) end)


function DiveAndDirectionalTrackingAI:onDestroyed(destroyedEvent)
        if rawequal(self:getOwnerLayerInterface(), destroyedEvent:getLayerInterface()) then
            TrackingEventHandler.getInstance():removeListener(self)
            DestroyedEventHandler.getInstance():removeListener(self)
        end
end
java_overload(DiveAndDirectionalTrackingAI, "onDestroyed", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "DestroyedEvent")) end)


function DiveAndDirectionalTrackingAI:setLastDirection(lastDirection)
        self.lastDirection = lastDirection
        local value = self:getLastDirection():getValue()
        if value < 4 then
            java_super(BasicAI, "setLastKey", 1)(self, self.directionToKeyMap[value + 1])
        end
end
java_overload(DiveAndDirectionalTrackingAI, "setLastDirection", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Direction")) end)


function DiveAndDirectionalTrackingAI:setLastKey(lastKey)
        java_super(BasicAI, "setLastKey", 1)(self, lastKey)
        if rawequal(self:getLastKey(), Canvas.LEFT) then
            self.lastDirection = DirectionFactory.getInstance().LEFT
        elseif rawequal(self:getLastKey(), Canvas.DOWN) then
            self.lastDirection = DirectionFactory.getInstance().DOWN
        elseif rawequal(self:getLastKey(), Canvas.UP) then
            self.lastDirection = DirectionFactory.getInstance().UP
        elseif rawequal(self:getLastKey(), Canvas.RIGHT) then
            self.lastDirection = DirectionFactory.getInstance().RIGHT
        end
end
java_overload(DiveAndDirectionalTrackingAI, "setLastKey", 1, function(java_a1) return true and type(java_a1) == "number" end)


function DiveAndDirectionalTrackingAI:getLastDirection()
        return self.lastDirection
end
java_overload(DiveAndDirectionalTrackingAI, "getLastDirection", 0)


function DiveAndDirectionalTrackingAI:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(tostring(BasicAI))
        stringBuffer:append(" LastDirection: ")
        stringBuffer:append(StringUtil.getInstance():toString(self:getLastDirection()))
        return tostring(stringBuffer)
end
java_overload(DiveAndDirectionalTrackingAI, "toString", 0)
DiveAndDirectionalTrackingAI.__tostring = function(self) return self:toString() end

return DiveAndDirectionalTrackingAI

