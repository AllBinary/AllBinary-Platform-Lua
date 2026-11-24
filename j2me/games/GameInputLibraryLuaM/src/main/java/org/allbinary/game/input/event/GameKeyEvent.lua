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
-- package org.allbinary.game.input.event

local GameKeyEvent = {}
package.loaded["org.allbinary.game.input.event.GameKeyEvent"] = GameKeyEvent

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

local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AllBinaryEventObject = require("org.allbinary.logic.util.event.AllBinaryEventObject")

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

-- class table GameKeyEvent is declared before the requires
GameKeyEvent.__index = GameKeyEvent
GameKeyEvent.className = "GameKeyEvent"
GameKeyEvent.javaClassName = "org.allbinary.game.input.event.GameKeyEvent"
setmetatable(GameKeyEvent, {__index = AllBinaryEventObject})

function GameKeyEvent:_init_fields()
    if self.sourceId == nil then self.sourceId = nil end
    if self.repeated == nil then self.repeated = false end
    if self.key == nil then self.key = nil end
    if self.gameActionKey == nil then self.gameActionKey = 0 end
    if self.originalKey == nil then self.originalKey = 0 end
end


function GameKeyEvent.createEvent(anyType, sourceId, key)
        return GameKeyEvent.new(anyType, sourceId, 0, 0, key, false)
end


function GameKeyEvent._jinit(self, anyType, sourceId, originalKey, gameActionKey, key, repeated)
    java_super_init(AllBinaryEventObject, self, anyType)
    GameKeyEvent._init_fields(self)
        -- super(...) made self above
        self.sourceId = sourceId
        self:setOriginalKey(originalKey)
        self.key = key
        self:setGameActionKey(gameActionKey)
        self:setRepeatEvents(repeated)
    return self
end

function GameKeyEvent.new(...)
    local self = setmetatable({}, GameKeyEvent)
    GameKeyEvent._jinit(self, ...)
    return self
end


function GameKeyEvent:init(anyType)
        self:setSource(anyType)
end
java_overload(GameKeyEvent, "init", 1)


function GameKeyEvent:setRepeatEvents(repeated)
        self.repeated = repeated
end
java_overload(GameKeyEvent, "setRepeatEvents", 1, function(java_a1) return true and type(java_a1) == "boolean" end)


function GameKeyEvent:hasRepeatEvents()
        return self.repeated
end
java_overload(GameKeyEvent, "hasRepeatEvents", 0)


function GameKeyEvent:getKey()
        return self.key
end
java_overload(GameKeyEvent, "getKey", 0)


function GameKeyEvent:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("\nKey: ")
        stringBuffer:appendint(self:getKey())
        return tostring(stringBuffer)
end
java_overload(GameKeyEvent, "toString", 0)
GameKeyEvent.__tostring = function(self) return self:toString() end


function GameKeyEvent:getOriginalKey()
        return self.originalKey
end
java_overload(GameKeyEvent, "getOriginalKey", 0)


function GameKeyEvent:setOriginalKey(originalKey)
        self.originalKey = originalKey
end
java_overload(GameKeyEvent, "setOriginalKey", 1, function(java_a1) return true and type(java_a1) == "number" end)


function GameKeyEvent:getGameActionKey()
        return self.gameActionKey
end
java_overload(GameKeyEvent, "getGameActionKey", 0)


function GameKeyEvent:setGameActionKey(gameActionKey)
        self.gameActionKey = gameActionKey
end
java_overload(GameKeyEvent, "setGameActionKey", 1, function(java_a1) return true and type(java_a1) == "number" end)


function GameKeyEvent:getSourceId()
        return self.sourceId
end
java_overload(GameKeyEvent, "getSourceId", 0)

GameKeyEvent.NONE = GameKeyEvent.new(NullUtil.getInstance().NULL_OBJECT, -1, -1, -1, -1, false)

return GameKeyEvent

