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
-- package org.allbinary.game.input

local PlayerGameInput = {}
package.loaded["org.allbinary.game.input.PlayerGameInput"] = PlayerGameInput

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

local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")
local GameKeyEventListenerInterface = java_lazy("org.allbinary.game.input.event.GameKeyEventListenerInterface")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local CommonLabels = java_lazy("org.allbinary.string.CommonLabels")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local GameInput = require("org.allbinary.game.input.GameInput")
local GameInputStrings = java_lazy("org.allbinary.game.input.GameInputStrings")

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

-- class table PlayerGameInput is declared before the requires
PlayerGameInput.__index = PlayerGameInput
PlayerGameInput.className = "PlayerGameInput"
PlayerGameInput.javaClassName = "org.allbinary.game.input.PlayerGameInput"
setmetatable(PlayerGameInput, {__index = GameInput})
PlayerGameInput.java_implements = " GameKeyEventListenerInterface "
PlayerGameInput.java_interfaces = function() return {GameKeyEventListenerInterface} end

function PlayerGameInput:_init_fields()
    self.gameInputStrings = GameInputStrings.getInstance()
    if self.playerInputId == nil then self.playerInputId = 0 end
end


function PlayerGameInput._jinit(self, gameKeyEventList, removalGameKeyEventList, playerInputId)
    java_super_init(GameInput, self, gameKeyEventList, removalGameKeyEventList)
    PlayerGameInput._init_fields(self)
        -- super(...) made self above
        self.playerInputId = playerInputId
    return self
end

function PlayerGameInput.new(...)
    local self = setmetatable({}, PlayerGameInput)
    PlayerGameInput._jinit(self, ...)
    return self
end


function PlayerGameInput:onPressGameKeyEvent(gameKeyEvent)
        self:add(gameKeyEvent)
        self:addForRemoval(gameKeyEvent)
end
java_overload(PlayerGameInput, "onPressGameKeyEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GameKeyEvent")) end)


function PlayerGameInput:onDownGameKeyEvent(gameKeyEvent)
        self:add(gameKeyEvent)
end
java_overload(PlayerGameInput, "onDownGameKeyEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GameKeyEvent")) end)


function PlayerGameInput:onDownKeyEvent(gameKeyEvent)
        self:add(gameKeyEvent)
        self:addForRemoval(gameKeyEvent)
end
java_overload(PlayerGameInput, "onDownKeyEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GameKeyEvent")) end)


function PlayerGameInput:onDownKey(gameKeyEvent)
        PreLogUtil.put(tostring(StringMaker.new():append(CommonLabels.getInstance().START_LABEL):append(tostring(gameKeyEvent))), self, self.gameInputStrings.ON_DOWN_GAME_KEY)
end
java_overload(PlayerGameInput, "onDownKey", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function PlayerGameInput:onUpGameKeyEvent(gameKeyEvent)
        self:addForRemoval(gameKeyEvent)
end
java_overload(PlayerGameInput, "onUpGameKeyEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "GameKeyEvent")) end)


function PlayerGameInput:onUpKeyEvent(gameKeyEvent)
end
java_overload(PlayerGameInput, "onUpKeyEvent", 1, function(java_a1) return true and (java_a1 == nil or math.type(java_a1) == "integer") end)


function PlayerGameInput:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end
java_overload(PlayerGameInput, "onEvent", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AllBinaryEventObject")) end)


function PlayerGameInput:getPlayerInputId()
        return self.playerInputId
end
java_overload(PlayerGameInput, "getPlayerInputId", 0)

return PlayerGameInput

