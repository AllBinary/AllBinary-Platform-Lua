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

local TransformInfoData = {}
package.loaded["org.allbinary.logic.visual.transform.info.TransformInfoData"] = TransformInfoData

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

-- class table TransformInfoData is declared before the requires
TransformInfoData.__index = TransformInfoData
TransformInfoData.className = "TransformInfoData"
TransformInfoData.javaClassName = "org.allbinary.logic.visual.transform.info.TransformInfoData"

function TransformInfoData:_init_fields()
    self.PARENT = "TRANSFORM_INFO_PARENT"
    self.MAPPED = "TRANSFORM_INFO_MAPPED"
    self.NAME = "TRANSFORM_INFO_NAME"
    self.DESCRIPTION = "TRANSFORM_INFO_DESCRIPTION"
    self.CATEGORY = "TRANSFORM_INFO_CATEGORY"
    self.OBJECTFILENAME = "TRANSFORM_INFO_OBJECTFILENAME"
    self.OBJECT = "TRANSFORM_INFO_OBJECT"
    self.OBJECTCONFIGFILENAME = "TRANSFORM_INFO_OBJECTCONFIGFILENAME"
    self.OBJECTCONFIG = "TRANSFORM_INFO_OBJECTCONFIG"
    self.TEMPLATEFILENAME = "TRANSFORM_INFO_TEMPLATEFILENAME"
    self.TEMPLATE = "TRANSFORM_INFO_TEMPLATE"
    self.DATAFILENAME = "TRANSFORM_INFO_DATAFILENAME"
    self.DATA = "TRANSFORM_INFO_DATA"
    self.LABEL = "TRANSFORM_INFO_LABEL"
    self.OWNER = "OWNER_" .. self.NAME
    self.PARTIAL = "PARTIAL_" .. self.NAME
end


function TransformInfoData.getInstance()
        return TransformInfoData.instance_f
end


function TransformInfoData._jinit(self)
    TransformInfoData._init_fields(self)
    return self
end

function TransformInfoData.new(...)
    local self = setmetatable({}, TransformInfoData)
    TransformInfoData._jinit(self, ...)
    return self
end

TransformInfoData.instance_f = TransformInfoData.new()

return TransformInfoData

