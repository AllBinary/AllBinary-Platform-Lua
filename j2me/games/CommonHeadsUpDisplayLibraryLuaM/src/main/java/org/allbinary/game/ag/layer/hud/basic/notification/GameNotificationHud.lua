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
-- package org.allbinary.game.ag.layer.hud.basic.notification

local GameNotificationHud = {}
package.loaded["org.allbinary.game.ag.layer.hud.basic.notification.GameNotificationHud"] = GameNotificationHud

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

-- local Graphics = require("javax.microedition.lcdui.Graphics")
local BasicHud = require("org.allbinary.game.graphics.hud.BasicHud")
local BasicHudFactory = java_lazy("org.allbinary.game.graphics.hud.BasicHudFactory")
local GameNotificationEvent = java_lazy("org.allbinary.game.layer.hud.event.GameNotificationEvent")
local GameNotificationListenerInterface = java_lazy("org.allbinary.game.layer.hud.event.GameNotificationListenerInterface")
local BasicColor = java_lazy("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = java_lazy("org.allbinary.graphics.color.BasicColorFactory")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local GameNotification = java_lazy("org.allbinary.game.ag.layer.hud.basic.notification.GameNotification")

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

-- class table GameNotificationHud is declared before the requires
GameNotificationHud.__index = GameNotificationHud
GameNotificationHud.className = "GameNotificationHud"
GameNotificationHud.javaClassName = "org.allbinary.game.ag.layer.hud.basic.notification.GameNotificationHud"
setmetatable(GameNotificationHud, {__index = BasicHud})
GameNotificationHud.java_implements = " GameNotificationListenerInterface "
GameNotificationHud.java_interfaces = function() return {GameNotificationListenerInterface} end

function GameNotificationHud:_init_fields()
    self.METHOD_NAME = "onGameNotificationEvent"
    self.lastGameNotificationEvent = GameNotification.NULL_GAME_NOTIFICATION_EVENT
end


function GameNotificationHud._jinit(self, location, direction, bufferZone, basicColor)
    java_super_init(BasicHud, self, location, direction, bufferZone, basicColor)
    GameNotificationHud._init_fields(self)
        -- super(...) made self above
    return self
end

function GameNotificationHud.new(...)
    local self = setmetatable({}, GameNotificationHud)
    GameNotificationHud._jinit(self, ...)
    return self
end


function GameNotificationHud:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end
java_overload(GameNotificationHud, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


-- throws Exception
function GameNotificationHud:onGameNotificationEvent(gameNotificationEvent)
        if self.lastGameNotificationEvent ~= gameNotificationEvent then
            self.lastGameNotificationEvent = gameNotificationEvent
            self.logUtil:putF(gameNotificationEvent:getString(), self, self.METHOD_NAME)
        end
        self:add(gameNotificationEvent:getString(), gameNotificationEvent:getSeconds(), gameNotificationEvent:getBasicColorP(), gameNotificationEvent:getPermanent())
end
java_overload(GameNotificationHud, "onGameNotificationEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GameNotificationEvent")) end)


function GameNotificationHud:add(string_, seconds, basicColor, permanent)
end
java_overload(GameNotificationHud, "add", 4, function(java_a1, java_a2, java_a3, java_a4) return true and (java_a1 == nil or type(java_a1) == "string") and (java_a2 == nil or math.type(java_a2) == "integer") and (java_a3 == nil or java_is(java_a3, "BasicColor")) and (java_a4 == nil or type(java_a4) == "boolean") end)


-- throws Exception
function GameNotificationHud:processTick()
end
java_overload(GameNotificationHud, "processTick", 0)


function GameNotificationHud:paint(graphics)
end
java_overload(GameNotificationHud, "paint", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Graphics")) end)


function GameNotificationHud:clear()
end
java_overload(GameNotificationHud, "clear", 0)

GameNotificationHud.NULL_GAME_NOTIFICATION = GameNotificationHud.new(BasicHudFactory.getInstance().TOPCENTER, BasicHudFactory.getInstance().HORIZONTAL, 0, BasicColorFactory.getInstance().RED)

return GameNotificationHud

