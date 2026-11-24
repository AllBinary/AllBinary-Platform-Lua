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
-- package org.allbinary.logic.system.security.licensing.registration

local RegistrationConfiguration = {}
package.loaded["org.allbinary.logic.system.security.licensing.registration.RegistrationConfiguration"] = RegistrationConfiguration

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

-- local DataInputStream = require("java.io.DataInputStream")
-- local InputStream = require("java.io.InputStream")
-- local OutputStream = require("java.io.OutputStream")
local AbDataOutputStream = java_lazy("org.allbinary.logic.io.AbDataOutputStream")
local FileStreamFactory = java_lazy("org.allbinary.logic.io.FileStreamFactory")
local StreamUtil = java_lazy("org.allbinary.logic.io.StreamUtil")
local FileFactory = java_lazy("org.allbinary.logic.io.file.FileFactory")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")

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

-- class table RegistrationConfiguration is declared before the requires
RegistrationConfiguration.__index = RegistrationConfiguration
RegistrationConfiguration.className = "RegistrationConfiguration"
RegistrationConfiguration.javaClassName = "org.allbinary.logic.system.security.licensing.registration.RegistrationConfiguration"

function RegistrationConfiguration:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.registrationCode = "No Registration Code"
    self.NAME = "registrationid"
    self.FILE = "Registration.dat"
end


function RegistrationConfiguration._jinit(self)
    RegistrationConfiguration._init_fields(self)
        local try_ok, try_error, try_value = pcall(function()
            if FileFactory.getInstance():isFile(self.FILE) then
                self:read()
            else
                self:write()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local commonStrings = CommonStrings.getInstance()
            self.logUtil:put(commonStrings.EXCEPTION, self, commonStrings.CONSTRUCTOR, e)
        end
    return self
end

function RegistrationConfiguration.new(...)
    local self = setmetatable({}, RegistrationConfiguration)
    RegistrationConfiguration._jinit(self, ...)
    return self
end


function RegistrationConfiguration.getInstance()
        return RegistrationConfiguration.SINGLETON
end


-- throws Exception
function RegistrationConfiguration:read()
        local fileInputStreamFactory = FileStreamFactory.getInstance()
        local fileInputStream = fileInputStreamFactory:getFileInputStreamInstance(StringUtil.getInstance().EMPTY_STRING, self.FILE)
        local dataInputStream = DataInputStream.new(fileInputStream)
        self:setRegistrationCode(dataInputStream:readUTF())
        PreLogUtil.put(tostring(StringMaker.new():append("Read Configuration: "):append(tostring(self))), self, "read")
end


-- throws Exception
function RegistrationConfiguration:write()
        local dataOutputStream = nil
        local try_ok, try_error, try_value = pcall(function()
            self.logUtil:putF(tostring(StringMaker.new():append("Write Configuration: "):append(tostring(self))), self, "write")
            local fileInputStreamFactory = FileStreamFactory.getInstance()
            local fileOutputStream = fileInputStreamFactory:getFileOutputStreamInstance(StringUtil.getInstance().EMPTY_STRING, self.FILE)
            dataOutputStream = AbDataOutputStream.new(fileOutputStream)
            dataOutputStream:writeUTF(self:getRegistrationCode())
            dataOutputStream:flush()
        end)
        do -- finally
            StreamUtil.getInstance():close(dataOutputStream)
        end
        if not try_ok then error(try_error, 0) end
end


function RegistrationConfiguration:toString()
        return tostring(StringMaker.new():append("Registration Code: "):append(self:getRegistrationCode()))
end
RegistrationConfiguration.__tostring = function(self) return self:toString() end


function RegistrationConfiguration:setRegistrationCode(registrationCode)
        self.registrationCode = registrationCode
end


function RegistrationConfiguration:getRegistrationCode()
        return self.registrationCode
end

RegistrationConfiguration.SINGLETON = RegistrationConfiguration.new()

return RegistrationConfiguration

