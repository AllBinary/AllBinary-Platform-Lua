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
-- package org.allbinary.game.input.motion.action

local GameKeyCompleteMotionGestureInputEvent = {}
package.loaded["org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEvent"] = GameKeyCompleteMotionGestureInputEvent

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

local CompleteMotionGestureInputEvent = require("org.allbinary.game.input.CompleteMotionGestureInputEvent")
local GameKey = java_lazy("org.allbinary.game.input.GameKey")
local GameKeyEventSourceInterface = java_lazy("org.allbinary.game.input.GameKeyEventSourceInterface")
local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventFactory = java_lazy("org.allbinary.game.input.event.GameKeyEventFactory")
local InputToGameKeyMapping = java_lazy("org.allbinary.game.input.mapping.InputToGameKeyMapping")
local MotionGestureInput = java_lazy("org.allbinary.input.motion.gesture.MotionGestureInput")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local GameKeyCompleteMotionGestureInputEventFactory = java_lazy("org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEventFactory")

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

-- class table GameKeyCompleteMotionGestureInputEvent is declared before the requires
GameKeyCompleteMotionGestureInputEvent.__index = GameKeyCompleteMotionGestureInputEvent
GameKeyCompleteMotionGestureInputEvent.className = "GameKeyCompleteMotionGestureInputEvent"
GameKeyCompleteMotionGestureInputEvent.javaClassName = "org.allbinary.game.input.motion.action.GameKeyCompleteMotionGestureInputEvent"
setmetatable(GameKeyCompleteMotionGestureInputEvent, {__index = CompleteMotionGestureInputEvent})
GameKeyCompleteMotionGestureInputEvent.java_implements = " GameKeyEventSourceInterface "
GameKeyCompleteMotionGestureInputEvent.java_interfaces = function() return {GameKeyEventSourceInterface} end

function GameKeyCompleteMotionGestureInputEvent:_init_fields()
    self.gameKeyEventFactory = GameKeyEventFactory.getInstance()
    self.SOURCE_ID = self.gameKeyEventFactory.MOTION_GESTURE_SOURCE_ID
    self.gameKey = GameKey.NULL_GAME_KEY
    self.gameKeyEvent = GameKeyEvent.NONE
    if self.inputToGameKeyMapping == nil then self.inputToGameKeyMapping = nil end
end


function GameKeyCompleteMotionGestureInputEvent._jinit(self, name, motionGestureInput, inputToGameKeyMapping)
    java_super_init(CompleteMotionGestureInputEvent, self, name, motionGestureInput)
    GameKeyCompleteMotionGestureInputEvent._init_fields(self)
        -- super(...) made self above
        self.inputToGameKeyMapping = inputToGameKeyMapping
        GameKeyCompleteMotionGestureInputEventFactory.getInstance():add(self)
        self:update()
    return self
end

function GameKeyCompleteMotionGestureInputEvent.new(...)
    local self = setmetatable({}, GameKeyCompleteMotionGestureInputEvent)
    GameKeyCompleteMotionGestureInputEvent._jinit(self, ...)
    return self
end


function GameKeyCompleteMotionGestureInputEvent:getSourceId()
        return self.SOURCE_ID
end
java_overload(GameKeyCompleteMotionGestureInputEvent, "getSourceId", 0)


function GameKeyCompleteMotionGestureInputEvent:update()
        local try_ok, try_error, try_value = pcall(function()
            self:setGameKey(self.inputToGameKeyMapping:getInstance(self:getMotionGestureInput():getId()))
            self:setGameKeyEvent(self.gameKeyEventFactory:getInstanceForInput(self, self:getGameKey()))
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.UPDATE, e)
        end
end
java_overload(GameKeyCompleteMotionGestureInputEvent, "update", 0)


function GameKeyCompleteMotionGestureInputEvent:setGameKeyEvent(gameKeyEvent)
        self.gameKeyEvent = gameKeyEvent
end
java_overload(GameKeyCompleteMotionGestureInputEvent, "setGameKeyEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GameKeyEvent")) end)


function GameKeyCompleteMotionGestureInputEvent:getGameKeyEvent()
        return self.gameKeyEvent
end
java_overload(GameKeyCompleteMotionGestureInputEvent, "getGameKeyEvent", 0)


function GameKeyCompleteMotionGestureInputEvent:setGameKey(gameKey)
        self.gameKey = gameKey
end
java_overload(GameKeyCompleteMotionGestureInputEvent, "setGameKey", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GameKey")) end)


function GameKeyCompleteMotionGestureInputEvent:getGameKey()
        return self.gameKey
end
java_overload(GameKeyCompleteMotionGestureInputEvent, "getGameKey", 0)

return GameKeyCompleteMotionGestureInputEvent

