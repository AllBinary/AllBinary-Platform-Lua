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
-- package org.allbinary.game.midlet

local DemoGameMidletStateFactory = {}
package.loaded["org.allbinary.game.midlet.DemoGameMidletStateFactory"] = DemoGameMidletStateFactory

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

local DemoGameMidletState = java_lazy("org.allbinary.game.midlet.DemoGameMidletState")

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

-- class table DemoGameMidletStateFactory is declared before the requires
DemoGameMidletStateFactory.__index = DemoGameMidletStateFactory
DemoGameMidletStateFactory.className = "DemoGameMidletStateFactory"
DemoGameMidletStateFactory.javaClassName = "org.allbinary.game.midlet.DemoGameMidletStateFactory"

function DemoGameMidletStateFactory:_init_fields()
    self.NONE = DemoGameMidletState.new()
    self.START_DEMO = DemoGameMidletState.new()
    self.START_GAME = DemoGameMidletState.new()
    self.START_INPUT_MAPPING = DemoGameMidletState.new()
end


function DemoGameMidletStateFactory._jinit(self)
    DemoGameMidletStateFactory._init_fields(self)
    return self
end

function DemoGameMidletStateFactory.new(...)
    local self = setmetatable({}, DemoGameMidletStateFactory)
    DemoGameMidletStateFactory._jinit(self, ...)
    return self
end


function DemoGameMidletStateFactory.getInstance()
        return DemoGameMidletStateFactory.STATE
end

DemoGameMidletStateFactory.STATE = DemoGameMidletStateFactory.new()

return DemoGameMidletStateFactory

