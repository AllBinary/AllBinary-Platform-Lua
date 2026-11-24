-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
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
-- package org.allbinary.data.tables.generator

local IdGeneratorEntityFactory = {}
package.loaded["org.allbinary.data.tables.generator.IdGeneratorEntityFactory"] = IdGeneratorEntityFactory

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local IdGeneratorEntity = java_lazy("org.allbinary.data.tables.generator.IdGeneratorEntity")
local IdGeneratorEntityInterface = java_lazy("org.allbinary.data.tables.generator.IdGeneratorEntityInterface")

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

-- class table IdGeneratorEntityFactory is declared before the requires
IdGeneratorEntityFactory.__index = IdGeneratorEntityFactory
IdGeneratorEntityFactory.className = "IdGeneratorEntityFactory"
IdGeneratorEntityFactory.javaClassName = "org.allbinary.data.tables.generator.IdGeneratorEntityFactory"


function IdGeneratorEntityFactory._jinit(self)
    return self
end

function IdGeneratorEntityFactory.new(...)
    local self = setmetatable({}, IdGeneratorEntityFactory)
    IdGeneratorEntityFactory._jinit(self, ...)
    return self
end


function IdGeneratorEntityFactory.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", IdGeneratorEntity.new() end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local logUtil = LogUtil.getInstance()
            local commonStrings = CommonStrings.getInstance()
            logUtil:put(commonStrings.EXCEPTION, "ServerLicenseRequestEntityFactory", commonStrings.GET_INSTANCE, e)
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return IdGeneratorEntityFactory

