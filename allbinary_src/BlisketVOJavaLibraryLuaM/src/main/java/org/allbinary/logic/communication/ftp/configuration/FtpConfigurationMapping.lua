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
-- package org.allbinary.logic.communication.ftp.configuration

local FtpConfigurationMapping = {}
package.loaded["org.allbinary.logic.communication.ftp.configuration.FtpConfigurationMapping"] = FtpConfigurationMapping

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

local HashMap = java_lazy("java.util.HashMap")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local TableMappingInterface = java_lazy("org.allbinary.data.tables.TableMappingInterface")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local FtpConfigurationInterface = java_lazy("org.allbinary.logic.communication.ftp.configuration.FtpConfigurationInterface")

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

-- class table FtpConfigurationMapping is declared before the requires
FtpConfigurationMapping.__index = FtpConfigurationMapping
FtpConfigurationMapping.className = "FtpConfigurationMapping"
FtpConfigurationMapping.javaClassName = "org.allbinary.logic.communication.ftp.configuration.FtpConfigurationMapping"
FtpConfigurationMapping.java_implements = " TableMappingInterface "
FtpConfigurationMapping.java_interfaces = function() return {TableMappingInterface} end

function FtpConfigurationMapping:_init_fields()
    if self.ftpConfigurationInterface == nil then self.ftpConfigurationInterface = nil end
end


function FtpConfigurationMapping._jinit(self, ftpConfigurationInterface)
    FtpConfigurationMapping._init_fields(self)
        self.ftpConfigurationInterface = ftpConfigurationInterface
    return self
end

function FtpConfigurationMapping.new(...)
    local self = setmetatable({}, FtpConfigurationMapping)
    FtpConfigurationMapping._jinit(self, ...)
    return self
end


function FtpConfigurationMapping:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(FtpConfigurationData.SERVER, self.ftpConfigurationInterface:getServer())
        hashMap:put(FtpConfigurationData.USERNAME, self.ftpConfigurationInterface:getUserName())
        hashMap:put(FtpConfigurationData.PASSWORD, self.ftpConfigurationInterface:getPassword())
        hashMap:put(FtpConfigurationData.PATH, self.ftpConfigurationInterface:getPath())
        return hashMap
end


-- throws Exception
function FtpConfigurationMapping:getKey()
        return FtpConfigurationData.NAME
end


-- throws Exception
function FtpConfigurationMapping:toVector()
        local vector = BasicArrayListD.new()
        vector:add(self.ftpConfigurationInterface:getServer())
        vector:add(self.ftpConfigurationInterface:getUserName())
        vector:add(self.ftpConfigurationInterface:getPassword())
        vector:add(self.ftpConfigurationInterface:getPath())
        return vector
end

return FtpConfigurationMapping

