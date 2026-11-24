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
-- package org.allbinary.logic.visual.transform.template.customizer.widgets.logo

local LogoData = {}
package.loaded["org.allbinary.logic.visual.transform.template.customizer.widgets.logo.LogoData"] = LogoData

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

-- class table LogoData is declared before the requires
LogoData.__index = LogoData
LogoData.className = "LogoData"
LogoData.javaClassName = "org.allbinary.logic.visual.transform.template.customizer.widgets.logo.LogoData"

function LogoData:_init_fields()
    self.NAME = "LOGO_NAME"
    self.IMAGEPATH = "LOGO_IMAGE_PATH"
    self.IMAGEFILENAME = "LOGO_IMAGE_FILE_NAME"
    self.IMAGE = "LOGO_IMAGE"
end


function LogoData.getInstance()
        return LogoData.instance_f
end


function LogoData._jinit(self)
    LogoData._init_fields(self)
    return self
end

function LogoData.new(...)
    local self = setmetatable({}, LogoData)
    LogoData._jinit(self, ...)
    return self
end

LogoData.instance_f = LogoData.new()

return LogoData

