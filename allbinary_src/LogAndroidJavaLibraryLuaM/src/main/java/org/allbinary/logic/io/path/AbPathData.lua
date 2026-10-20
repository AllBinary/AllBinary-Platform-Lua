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
-- package org.allbinary.logic.io.path

local FilePathData = require("org.allbinary.logic.io.file.FilePathData")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbPathData = {}
AbPathData.__index = AbPathData
AbPathData.className = "AbPathData"

function AbPathData:_init_fields()
    self.EXTENSION_SEP = CommonSeps.getInstance().PERIOD
    self.SEPARATORCHAR = "/"
    self.SEPARATOR = CommonSeps.getInstance().FORWARD_SLASH
end


function AbPathData.getInstance()
        return AbPathData.instance
end


function AbPathData.new()
    local self = setmetatable({}, AbPathData)
    self:_init_fields()
    return self
end


function AbPathData:getExtensionIndex(filePath)
        local indexOfFileExtensionDelmiter = filePath:lastIndexOf(self.EXTENSION_SEP)
        local indexOfLatDelimiter = filePath:lastIndexOf(self.SEPARATORCHAR)
        if indexOfFileExtensionDelmiter < 0 then
            return -1
        end
        if indexOfFileExtensionDelmiter < indexOfLatDelimiter then
            return -1
        end
        return indexOfFileExtensionDelmiter
end


function AbPathData:getExtensionWithDot(filePath)
        local indexOfFileExtensionDelmiter = self:getExtensionIndex(filePath)
        local extension = StringUtil.getInstance().EMPTY_STRING
        if indexOfFileExtensionDelmiter >= 0 then
            extension = string.sub(filePath, (indexOfFileExtensionDelmiter) + 1)
        end
        return extension
end


function AbPathData:getExtension(filePath)
        local indexOfFileExtensionDelmiter = self:getExtensionIndex(filePath)
        local extension = StringUtil.getInstance().EMPTY_STRING
        if indexOfFileExtensionDelmiter >= 0 then
            extension = string.sub(filePath, (indexOfFileExtensionDelmiter + 1) + 1)
        end
        return extension
end


function AbPathData:getNameFromPath(path)
        local endIndex = path:lastIndexOf(self.SEPARATORCHAR)
        if endIndex < 0 then
            endIndex = path:lastIndexOf(FilePathData.getInstance().SEPARATORCHAR)
        end
        if endIndex < 0 then
            return path
        end
        if #path == endIndex + 1 then
            local categoryName = string.sub(path, (0) + 1, endIndex)
            return self:getNameFromPath(categoryName)
        else
            local categoryName = string.sub(path, (endIndex + 1) + 1)
            return categoryName
        end
end


function AbPathData:removeNameFromPath(path)
        local endIndex = path:lastIndexOf(self.SEPARATORCHAR)
        if endIndex < 0 then
            endIndex = path:lastIndexOf(FilePathData.getInstance().SEPARATORCHAR)
        end
        if endIndex < 0 then
            return StringUtil.getInstance().EMPTY_STRING
        end
        if #path == endIndex + 1 then
            return self:removeNameFromPath(string.sub(path, (0) + 1, endIndex - 1))
        else
            local pathWithoutName = string.sub(path, (0) + 1, endIndex)
            return pathWithoutName
        end
end

AbPathData.instance = AbPathData.new()

return AbPathData

