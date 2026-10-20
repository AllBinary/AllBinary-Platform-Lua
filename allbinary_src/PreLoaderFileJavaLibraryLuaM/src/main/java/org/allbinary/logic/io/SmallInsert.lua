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
-- package org.allbinary.logic.io

-- local DataOutputStream = require("java.io.DataOutputStream")
-- local FileOutputStream = require("java.io.FileOutputStream")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbFileSystem = require("org.allbinary.logic.io.file.AbFileSystem")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local SmallInsert = {}
SmallInsert.__index = SmallInsert
SmallInsert.className = "SmallInsert"

function SmallInsert:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.fileName = nil
    self.string = nil
end


function SmallInsert.new(fileName)
    local self = setmetatable({}, SmallInsert)
    self:_init_fields()
        self.fileName = fileName
        self.string = AbFileSystem.getInstance():readAsString(fileName)
    return self
end


function SmallInsert:atBeginning(text)
        local try_ok, try_error = pcall(function()
            local idFile = FileOutputStream.new(self.fileName)
            local idOutData = DataOutputStream.new(idFile)
            idOutData:writeBytes(text .. self.string)
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().IDLOGGING) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "insertAtBeginning", e)
            end
            return false
        end
end


function SmallInsert:after(text, after)
        local try_ok, try_error = pcall(function()
            local index = ((string.find(self.string, after, 1, true) or 0) - 1)
            if index < 0 then
                print("No such start: " .. after .. " in: " .. self.string)
                return false
            end
            index = index + #after
            local start = string.sub(self.string, (0) + 1, index)
            local end_ = string.sub(self.string, (index + 1) + 1, #self.string)
            local idFile = FileOutputStream.new(self.fileName)
            local idOutData = DataOutputStream.new(idFile)
            idOutData:writeBytes(start .. text .. end_)
            idOutData:close()
            idFile:close()
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().IDLOGGING) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "after", e)
            end
            return false
        end
end


function SmallInsert:atEnd(text)
        local try_ok, try_error = pcall(function()
            local idFile = FileOutputStream.new(self.fileName)
            local idOutData = DataOutputStream.new(idFile)
            idOutData:writeBytes(self.string .. text)
            return true
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().IDLOGGING) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "insertAtEnd", e)
            end
            return false
        end
end

return SmallInsert

