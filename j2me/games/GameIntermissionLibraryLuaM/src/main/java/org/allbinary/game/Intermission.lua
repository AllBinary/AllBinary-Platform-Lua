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
-- package org.allbinary.game

local Intermission = {}
package.loaded["org.allbinary.game.Intermission"] = Intermission

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

local TimeDelayHelper = java_lazy("org.allbinary.time.TimeDelayHelper")
local IntermissionInterface = require("org.allbinary.game.IntermissionInterface")
local IntermissionEnableListenerInterface = java_lazy("org.allbinary.game.IntermissionEnableListenerInterface")
local NullIntermissionEnableListener = java_lazy("org.allbinary.game.NullIntermissionEnableListener")

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

-- class table Intermission is declared before the requires
Intermission.__index = Intermission
Intermission.className = "Intermission"
Intermission.javaClassName = "org.allbinary.game.Intermission"
Intermission.java_implements = " IntermissionInterface "
Intermission.java_interfaces = function() return {IntermissionInterface} end

function Intermission:_init_fields()
    if self.enabled == nil then self.enabled = false end
    self.timeElapsedHelper = TimeDelayHelper.new(0)
    self.intermissionEnableListener = NullIntermissionEnableListener.getInstance()
end


function Intermission._jinit(self)
    Intermission._init_fields(self)
    return self
end

function Intermission.new(...)
    local self = setmetatable({}, Intermission)
    Intermission._jinit(self, ...)
    return self
end


function Intermission:setListener(enableListener)
        self.intermissionEnableListener = enableListener
end


function Intermission:getTimeDelayHelper()
        return self.timeElapsedHelper
end


function Intermission:setEnabled(enabled)
        self.enabled = enabled
        if self:isEnabled() then
            self:getTimeDelayHelper():setStartTimeTNT()
        end
        self.intermissionEnableListener:notifyIntermission(enabled)
end


function Intermission:isEnabled()
        return self.enabled
end

return Intermission

