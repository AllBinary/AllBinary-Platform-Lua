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
-- package org.allbinary.input.automation.module.generic

local GenericConfigData = {}
package.loaded["org.allbinary.input.automation.module.generic.GenericConfigData"] = GenericConfigData

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

-- class table GenericConfigData is declared before the requires
GenericConfigData.__index = GenericConfigData
GenericConfigData.className = "GenericConfigData"
GenericConfigData.javaClassName = "org.allbinary.input.automation.module.generic.GenericConfigData"


function GenericConfigData._jinit(self)
    return self
end

function GenericConfigData.new(...)
    local self = setmetatable({}, GenericConfigData)
    GenericConfigData._jinit(self, ...)
    return self
end

GenericConfigData.RELATIVE_PATH = "./"
GenericConfigData.CONFIG_PATH = "modules/configs/"
GenericConfigData.MODULE_RELATIVE_PATH = tostring(GenericConfigData.RELATIVE_PATH + GenericConfigData.CONFIG_PATH) .. "allbinary/input/automation/module/"
GenericConfigData.GAME_MODULE_RELATIVE_PATH = tostring(GenericConfigData.MODULE_RELATIVE_PATH) .. "game/"
GenericConfigData.MMO_GAME_MODULE_RELATIVE_PATH = tostring(GenericConfigData.GAME_MODULE_RELATIVE_PATH) .. "mmog/"
GenericConfigData.FREE_MMO_GAME_MODULE_RELATIVE_PATH = "free/"

return GenericConfigData

