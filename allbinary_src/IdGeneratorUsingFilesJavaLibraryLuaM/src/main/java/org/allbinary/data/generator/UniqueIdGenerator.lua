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

-- local IOException = require("java.io.IOException")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbDataInputStream = require("org.allbinary.logic.io.AbDataInputStream")
local AbDataOutputStream = require("org.allbinary.logic.io.AbDataOutputStream")
local AbFileInputStream = require("org.allbinary.logic.io.AbFileInputStream")
local AbFileOutputStream = require("org.allbinary.logic.io.AbFileOutputStream")
local DataOutputStreamFactory = require("org.allbinary.logic.io.DataOutputStreamFactory")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local IdGeneratorInterface = require("org.allbinary.data.generator.IdGeneratorInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UniqueIdGenerator = {}
UniqueIdGenerator.__index = UniqueIdGenerator
UniqueIdGenerator.className = "UniqueIdGenerator"

function UniqueIdGenerator:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.newFile = nil
    self.id = 0
end


function UniqueIdGenerator.new()
    local self = setmetatable({}, UniqueIdGenerator)
    self:_init_fields()
    return self
end


function UniqueIdGenerator:initialize(value)
        local try_ok, try_error = pcall(function()
            self.newFile:createNewFile()
            local idData = DataOutputStreamFactory.getInstance():getInstanceForAbFile(self.newFile)
            idData:writeLong(value)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().IDLOGGING) then
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
        local try_ok, try_error = pcall(function()
            local idFile = AbFileInputStream.new(self.newFile)
            idData = AbDataInputStream.new(idFile)
            self.id = idData:readLong()
            local idOutFile = AbFileOutputStream.createFromAbFile(self.newFile)
            idOutData = AbDataOutputStream.new(idOutFile)
            idOutData:writeLong(self.id + 1)
            local idLong = self.id
            return tostring(idLong)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().IDLOGGING) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "getNext", e)
            end
            return "Error"
        end
        do -- finally
            StreamUtil.getInstance():close(idData)
            StreamUtil.getInstance():close(idOutData)
        end
end

UniqueIdGenerator.EXT = ".unq"

return UniqueIdGenerator

