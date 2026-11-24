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

local HorizontalScreenPatrolAI = {}
package.loaded["org.allbinary.game.ag.ai.scroller.HorizontalScreenPatrolAI"] = HorizontalScreenPatrolAI

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

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local BasicAI = require("org.allbinary.game.ai.BasicAI")
local GameInput = java_lazy("org.allbinary.game.input.GameInput")
local AllBinaryGameLayerManager = java_lazy("org.allbinary.game.layer.AllBinaryGameLayerManager")
local MyRandomFactory = java_lazy("org.allbinary.game.rand.MyRandomFactory")
local DisplayInfoSingleton = java_lazy("org.allbinary.graphics.displayable.DisplayInfoSingleton")
local AllBinaryLayer = java_lazy("org.allbinary.layer.AllBinaryLayer")
local AllBinaryLayerManager = java_lazy("org.allbinary.layer.AllBinaryLayerManager")
local SmallIntegerSingletonFactory = java_lazy("org.allbinary.logic.math.SmallIntegerSingletonFactory")
local PlayerQueue = java_lazy("org.allbinary.media.audio.PlayerQueue")
local SecondaryPlayerQueueFactory = java_lazy("org.allbinary.media.audio.SecondaryPlayerQueueFactory")
local Sound = java_lazy("org.allbinary.media.audio.Sound")
local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local ABHashtable = java_lazy("org.allbinary.util.ABHashtable")

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

-- class table HorizontalScreenPatrolAI is declared before the requires
HorizontalScreenPatrolAI.__index = HorizontalScreenPatrolAI
HorizontalScreenPatrolAI.className = "HorizontalScreenPatrolAI"
HorizontalScreenPatrolAI.javaClassName = "org.allbinary.game.ag.ai.scroller.HorizontalScreenPatrolAI"
setmetatable(HorizontalScreenPatrolAI, {__index = BasicAI})

function HorizontalScreenPatrolAI:_init_fields()
    self.keyDirection = Canvas.LEFT
    self.displayInfoSingleton = DisplayInfoSingleton.getInstance()
    self.firingX = self.displayInfoSingleton:getLastHalfWidth()
    self.firedIndex = 0
    self.MAX_FIRE = 28
    self.timeDelayHelper = TimeDelayHelper.new(240)
    self.secondaryPlayerQueue = SecondaryPlayerQueueFactory.getInstance()
    if self.sound == nil then self.sound = nil end
end


function HorizontalScreenPatrolAI._jinit(self, hashtable, ownerLayerInterface, gameInput)
    java_super_init(BasicAI, self, ownerLayerInterface, gameInput)
    HorizontalScreenPatrolAI._init_fields(self)
        -- super(...) made self above
        self.sound = hashtable:get(HorizontalScreenPatrolAI.SOUND)
        if self.sound == nil then
            error(require("java.lang.Exception").new("No Sound Provided!!"), 0)
        end
    return self
end

function HorizontalScreenPatrolAI.new(...)
    local self = setmetatable({}, HorizontalScreenPatrolAI)
    HorizontalScreenPatrolAI._jinit(self, ...)
    return self
end


-- throws Exception
function HorizontalScreenPatrolAI:processAI(allBinaryLayerManager)
        java_super(BasicAI, "processKeyAI", 1)(self, self.keyDirection)
        if self.timeDelayHelper:isTimeTNT() then
            local layerInterface = self:getOwnerLayerInterface()
            local currentOwnerLayerX = layerInterface:getXP()
            if currentOwnerLayerX < -layerInterface:getWidth() then
                local y = MyRandomFactory.getInstance():getAbsoluteNextIntAllowZero(50)
                layerInterface:setPosition(self.displayInfoSingleton:getLastWidth() + layerInterface:getWidth() + 50, y, layerInterface:getZP())
                self.firedIndex = 0
                self.firingX = self.displayInfoSingleton:getLastHalfWidth() + MyRandomFactory.getInstance():getNextInt(self.displayInfoSingleton:getLastHalfWidth())
                self.secondaryPlayerQueue:add(self.sound)
            end
            if currentOwnerLayerX < self.firingX and currentOwnerLayerX > -layerInterface:getWidth() then
                java_super(BasicAI, "processKeyAI", 1)(self, Canvas.KEY_NUM1)
                local gameLayerManager = allBinaryLayerManager
                local FIRE = (((gameLayerManager:getGameInfo():getCurrentLevel() + 12)) // (1 << (2)))
                if FIRE > self.MAX_FIRE then
                    FIRE = self.MAX_FIRE
                end
                if self.firedIndex > FIRE then
                    self.firedIndex = 0
                    self.firingX = require("java.lang.Integer").MIN_VALUE
                end
                self.firedIndex = self.firedIndex + 1
            end
        end
end
java_overload(HorizontalScreenPatrolAI, "processAI", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryLayerManager")) end)


function HorizontalScreenPatrolAI:nextDirection()
end
java_overload(HorizontalScreenPatrolAI, "nextDirection", 0)

HorizontalScreenPatrolAI.SOUND = SmallIntegerSingletonFactory.getInstance():getAt(433)

return HorizontalScreenPatrolAI

