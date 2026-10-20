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

local SmallDelete = {}
SmallDelete.__index = SmallDelete
SmallDelete.className = "SmallDelete"

function SmallDelete:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.fileName = nil
    self.string = nil
end


function SmallDelete.new(fileName)
    local self = setmetatable({}, SmallDelete)
    self:_init_fields()
        self.fileName = fileName
        self.string = AbFileSystem.getInstance():readAsString(fileName)
    return self
end


function SmallDelete:deleteAtStart(start, end_)
        local try_ok, try_error = pcall(function()
            local beginIndex = 0
            local endIndex = 0
            beginIndex = ((string.find(self.string, start, 1, true) or 0) - 1)
            endIndex = ((string.find(self.string, end_, 1, true) or 0) - 1)
            if endIndex > beginIndex and beginIndex >= 0 and endIndex >= 0 and beginIndex < 10 and endIndex < 525 then
                local text = string.sub(self.string, (endIndex) + 1, #self.string)
                local idFile = FileOutputStream.new(self.fileName)
                local idOutData = DataOutputStream.new(idFile)
                idOutData:writeBytes(text)
                return true
            end
            return false
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().IDLOGGING) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "deleteAtStart", e)
            end
            return false
        end
end


function SmallDelete:deleteBetween(start, end_, newText)
        local try_ok, try_error = pcall(function()
            local beginIndex = 0
            local endIndex = 0
            beginIndex = ((string.find(self.string, start, 1, true) or 0) - 1)
            endIndex = ((string.find(self.string, end_, 1, true) or 0) - 1)
            if endIndex > beginIndex and beginIndex >= 0 and endIndex >= 0 and beginIndex < 50 and endIndex < 425 then
                local newStart = string.sub(self.string, (0) + 1, beginIndex)
                local text = string.sub(self.string, (endIndex + #end_) + 1, #self.string)
                local idFile = FileOutputStream.new(self.fileName)
                local idOutData = DataOutputStream.new(idFile)
                idOutData:writeBytes(newStart .. newText .. text)
                return true
            end
            return false
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().IDLOGGING) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "deleteAtStart", e)
            end
            return false
        end
end

return SmallDelete

