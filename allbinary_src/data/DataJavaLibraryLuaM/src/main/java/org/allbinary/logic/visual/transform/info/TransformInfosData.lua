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
-- package org.allbinary.logic.visual.transform.info

local TransformInfosData = {}
package.loaded["org.allbinary.logic.visual.transform.info.TransformInfosData"] = TransformInfosData

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

-- class table TransformInfosData is declared before the requires
TransformInfosData.__index = TransformInfosData
TransformInfosData.className = "TransformInfosData"
TransformInfosData.javaClassName = "org.allbinary.logic.visual.transform.info.TransformInfosData"

function TransformInfosData:_init_fields()
    self.NAME = "TRANSFORM_INFOS_NAME"
    self.GROUP = "TRANSFORM_INFOS_GROUP"
    self.ALL = "TRANSFORM_INFOS_ALL"
    self.PREVIEW = "TRANSFORM_INFOS_PREVIEW"
    self.SMALL_PREVIEW = "TRANSFORM_INFOS_SMALL_PREVIEW"
end


function TransformInfosData._jinit(self)
    TransformInfosData._init_fields(self)
    return self
end

function TransformInfosData.new(...)
    local self = setmetatable({}, TransformInfosData)
    TransformInfosData._jinit(self, ...)
    return self
end


function TransformInfosData.getInstance()
        return TransformInfosData.instance_f
end

TransformInfosData.instance_f = TransformInfosData.new()

return TransformInfosData

