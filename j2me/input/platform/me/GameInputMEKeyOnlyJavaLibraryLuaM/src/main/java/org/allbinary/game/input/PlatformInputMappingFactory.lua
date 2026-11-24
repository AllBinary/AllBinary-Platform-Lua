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

local PlatformInputMappingFactory = {}
package.loaded["org.allbinary.game.input.PlatformInputMappingFactory"] = PlatformInputMappingFactory

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

local PersistentInputMapping = java_lazy("org.allbinary.game.input.mapping.PersistentInputMapping")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local NormalJ2MEGameInputMapping = java_lazy("org.allbinary.game.input.NormalJ2MEGameInputMapping")

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

-- class table PlatformInputMappingFactory is declared before the requires
PlatformInputMappingFactory.__index = PlatformInputMappingFactory
PlatformInputMappingFactory.className = "PlatformInputMappingFactory"
PlatformInputMappingFactory.javaClassName = "org.allbinary.game.input.PlatformInputMappingFactory"

function PlatformInputMappingFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.inputToGameKeyMapping = PersistentInputMapping.getNullInstance()
end

function PlatformInputMappingFactory._jinit(self)
    PlatformInputMappingFactory._init_fields(self)
    return self
end

function PlatformInputMappingFactory.new()
    return PlatformInputMappingFactory._jinit(setmetatable({}, PlatformInputMappingFactory))
end


function PlatformInputMappingFactory.getInstance()
        return PlatformInputMappingFactory.instance_f
end


function PlatformInputMappingFactory:getPersistentInputMappingInstance()
        local try_ok, try_error, try_value = pcall(function()
            if self.inputToGameKeyMapping == PersistentInputMapping.getNullInstance() then
                self.inputToGameKeyMapping = NormalJ2MEGameInputMapping.new()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.GET_INSTANCE, e)
        end
        return self.inputToGameKeyMapping
end

PlatformInputMappingFactory.instance_f = PlatformInputMappingFactory.new()

return PlatformInputMappingFactory

