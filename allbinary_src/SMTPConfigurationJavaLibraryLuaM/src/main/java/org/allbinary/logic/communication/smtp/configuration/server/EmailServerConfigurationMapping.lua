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
-- package org.allbinary.logic.communication.smtp.configuration.server

local EmailServerConfigurationMapping = {}
package.loaded["org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationMapping"] = EmailServerConfigurationMapping

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
local EmailServerConfigurationInterface = java_lazy("org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationInterface")

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

-- class table EmailServerConfigurationMapping is declared before the requires
EmailServerConfigurationMapping.__index = EmailServerConfigurationMapping
EmailServerConfigurationMapping.className = "EmailServerConfigurationMapping"
EmailServerConfigurationMapping.javaClassName = "org.allbinary.logic.communication.smtp.configuration.server.EmailServerConfigurationMapping"
EmailServerConfigurationMapping.java_implements = " TableMappingInterface "
EmailServerConfigurationMapping.java_interfaces = function() return {TableMappingInterface} end

function EmailServerConfigurationMapping:_init_fields()
    if self.emailServerConfigurationInterface == nil then self.emailServerConfigurationInterface = nil end
end


function EmailServerConfigurationMapping._jinit(self, emailServerConfigurationInterface)
    EmailServerConfigurationMapping._init_fields(self)
        self.emailServerConfigurationInterface = emailServerConfigurationInterface
    return self
end

function EmailServerConfigurationMapping.new(...)
    local self = setmetatable({}, EmailServerConfigurationMapping)
    EmailServerConfigurationMapping._jinit(self, ...)
    return self
end


function EmailServerConfigurationMapping:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(EmailServerConfigurationData.SERVER, self.emailServerConfigurationInterface:getSmtpServer())
        hashMap:put(EmailServerConfigurationData.ACCOUNT, self.emailServerConfigurationInterface:getAccountName())
        hashMap:put(EmailServerConfigurationData.PASSWORD, self.emailServerConfigurationInterface:getPassword())
        return hashMap
end


-- throws Exception
function EmailServerConfigurationMapping:getKey()
        return EmailServerConfigurationData.NAME
end


-- throws Exception
function EmailServerConfigurationMapping:toVector()
        local vector = BasicArrayListD.new()
        vector:add(self.emailServerConfigurationInterface:getSmtpServer())
        return vector
end

return EmailServerConfigurationMapping

