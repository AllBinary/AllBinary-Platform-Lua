-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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
-- package org.allbinary.logic.visual.transform.info.objectConfig.generator

local TransformInfoObjectConfigGenerator = {}
package.loaded["org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGenerator"] = TransformInfoObjectConfigGenerator

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

local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local TransformInfoObjectConfigGeneratorInterface = require("org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGeneratorInterface")

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

-- class table TransformInfoObjectConfigGenerator is declared before the requires
TransformInfoObjectConfigGenerator.__index = TransformInfoObjectConfigGenerator
TransformInfoObjectConfigGenerator.className = "TransformInfoObjectConfigGenerator"
TransformInfoObjectConfigGenerator.javaClassName = "org.allbinary.logic.visual.transform.info.objectConfig.generator.TransformInfoObjectConfigGenerator"
TransformInfoObjectConfigGenerator.java_implements = " TransformInfoObjectConfigGeneratorInterface "
TransformInfoObjectConfigGenerator.java_interfaces = function() return {TransformInfoObjectConfigGeneratorInterface} end

function TransformInfoObjectConfigGenerator:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
end

function TransformInfoObjectConfigGenerator._jinit(self)
    TransformInfoObjectConfigGenerator._init_fields(self)
    return self
end

function TransformInfoObjectConfigGenerator.new()
    return TransformInfoObjectConfigGenerator._jinit(setmetatable({}, TransformInfoObjectConfigGenerator))
end


-- throws Exception
function TransformInfoObjectConfigGenerator:process(input)
        error(require("java.lang.RuntimeException").new(), 0)
end

return TransformInfoObjectConfigGenerator

