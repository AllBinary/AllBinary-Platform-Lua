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
-- package org.allbinary.game.combat.destroy.event

local DestroyEventFactory = {}
package.loaded["org.allbinary.game.combat.destroy.event.DestroyEventFactory"] = DestroyEventFactory

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

local AllBinaryGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local AllBinaryEventObjectFactoryInterface = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObjectFactoryInterface")
local DestroyedEvent = java_lazy("org.allbinary.game.combat.destroy.event.DestroyedEvent")

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

-- class table DestroyEventFactory is declared before the requires
DestroyEventFactory.__index = DestroyEventFactory
DestroyEventFactory.className = "DestroyEventFactory"
DestroyEventFactory.javaClassName = "org.allbinary.game.combat.destroy.event.DestroyEventFactory"
DestroyEventFactory.java_implements = " AllBinaryEventObjectFactoryInterface "
DestroyEventFactory.java_interfaces = function() return {AllBinaryEventObjectFactoryInterface} end

function DestroyEventFactory:_init_fields()
    if self.combatGameCanvas == nil then self.combatGameCanvas = nil end
end


function DestroyEventFactory._jinit(self, combatGameCanvas)
    DestroyEventFactory._init_fields(self)
        self.combatGameCanvas = combatGameCanvas
    return self
end

function DestroyEventFactory.new(...)
    local self = setmetatable({}, DestroyEventFactory)
    DestroyEventFactory._jinit(self, ...)
    return self
end


function DestroyEventFactory:getInstance()
        return DestroyedEvent.new(self.combatGameCanvas)
end

return DestroyEventFactory

