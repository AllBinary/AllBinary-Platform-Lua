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
-- package org.allbinary.data.generator

local UniqueIdGenerator = {}
package.loaded["org.allbinary.data.generator.UniqueIdGenerator"] = UniqueIdGenerator

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

-- local IOException = require("java.io.IOException")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbDataInputStream = java_lazy("org.allbinary.logic.io.AbDataInputStream")
local AbDataOutputStream = java_lazy("org.allbinary.logic.io.AbDataOutputStream")
local AbFileInputStream = java_lazy("org.allbinary.logic.io.AbFileInputStream")
local AbFileOutputStream = java_lazy("org.allbinary.logic.io.AbFileOutputStream")
local DataOutputStreamFactory = java_lazy("org.allbinary.logic.io.DataOutputStreamFactory")
local StreamUtil = java_lazy("org.allbinary.logic.io.StreamUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local IdGeneratorInterface = require("org.allbinary.data.generator.IdGeneratorInterface")

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

-- class table UniqueIdGenerator is declared before the requires
UniqueIdGenerator.__index = UniqueIdGenerator
UniqueIdGenerator.className = "UniqueIdGenerator"
UniqueIdGenerator.javaClassName = "org.allbinary.data.generator.UniqueIdGenerator"
UniqueIdGenerator.java_implements = " IdGeneratorInterface "
UniqueIdGenerator.java_interfaces = function() return {IdGeneratorInterface} end

function UniqueIdGenerator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.newFile == nil then self.newFile = nil end
    self.id = 0
end


function UniqueIdGenerator._jinit(self)
    UniqueIdGenerator._init_fields(self)
    return self
end

function UniqueIdGenerator.new(...)
    local self = setmetatable({}, UniqueIdGenerator)
    UniqueIdGenerator._jinit(self, ...)
    return self
end


function UniqueIdGenerator:initialize(value)
        local try_ok, try_error, try_value = pcall(function()
            self.newFile:createNewFile()
            local idData = DataOutputStreamFactory.getInstance():getInstanceForAbFile(self.newFile)
            idData:writeLong(value)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().IDLOGGING) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "initialize", e)
            end
        end
end


-- throws Exception
function UniqueIdGenerator:setFile(filePathName, name)
        self.newFile = AbFile.createAbFile(filePathName)
end


-- throws IOException
function UniqueIdGenerator:getNext()
        local idData = nil
        local idOutData = nil
        local try_ok, try_error, try_value = pcall(function()
            local idFile = AbFileInputStream.createFromAbFile(self.newFile)
            idData = AbDataInputStream.new(idFile)
            self.id = idData:readLong()
            local idOutFile = AbFileOutputStream.createFromAbFile(self.newFile)
            idOutData = AbDataOutputStream.new(idOutFile)
            idOutData:writeLong(self.id + 1)
            local idLong = self.id
            do return "__jreturn", tostring(idLong) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().IDLOGGING) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "getNext", e)
            end
            return "Error"
        end
        do -- finally
            StreamUtil.getInstance():close(idData)
            StreamUtil.getInstance():close(idOutData)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

UniqueIdGenerator.EXT = ".unq"

return UniqueIdGenerator

