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
-- package org.allbinary.logic.io.file.path

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local FilePathData = require("org.allbinary.logic.io.file.FilePathData")
local AbFilePath = require("org.allbinary.logic.io.path.AbFilePath")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--Used to correct user input for paths
local AbPathUtilOld = {}
AbPathUtilOld.__index = AbPathUtilOld
AbPathUtilOld.className = "AbPathUtilOld"

function AbPathUtilOld:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abPathData = AbPathData.getInstance()
    self.filePathData = FilePathData.getInstance()
end


function AbPathUtilOld.getInstance()
        return AbPathUtilOld.instance
end


function AbPathUtilOld.new()
    local self = setmetatable({}, AbPathUtilOld)
    self:_init_fields()
    return self
end


-- throws Exception
function AbPathUtilOld:getExtension(abFilePath)
        return self:getExtension(tostring(abFilePath))
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function AbPathUtilOld:getExtension(abPath)
        return self:getExtension(tostring(abPath))
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function AbPathUtilOld:getExtension(filePath)
        if #filePath < AbPathUtilOld.MIN then
            error(java_exception("Exception", "Could not be a file path since its less that 4 characters"), 0)
        end
        local beginIndex = #filePath - AbPathUtilOld.MIN
        local extension = string.sub(filePath, (beginIndex + 1) + 1)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("FileExtension: " .. extension, self, "getExtension()")
        end
        return extension
end


-- throws Exception
function AbPathUtilOld:getWithoutExtension(abFilePath)
        return self:getWithoutExtension(tostring(abFilePath))
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function AbPathUtilOld:getWithoutExtension(abPath)
        return self:getWithoutExtension(tostring(abPath))
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function AbPathUtilOld:getWithoutExtension(filePath)
        if #filePath < AbPathUtilOld.MIN then
            error(java_exception("Exception", "Could not be a file path since its less that 4 characters"), 0)
        end
        local endIndex = #filePath - AbPathUtilOld.MIN
        local pathWithoutExtension = string.sub(filePath, (0) + 1, endIndex)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEW) then
            self.logUtil:putF("FileWithoutExtension: " .. pathWithoutExtension, self, "getWithoutExtension()")
        end
        return pathWithoutExtension
end


function AbPathUtilOld:isValid(path)
        if self:isValidStart(path) then
            if self:isValidEnd(path) then
                return true
            end
        end
        return false
end


function AbPathUtilOld:isValidStart(path)
        if string.sub(path, (0) + 1, (0) + 1) == self.abPathData.SEPARATORCHAR then
            return true
        else
            return false
        end
end


function AbPathUtilOld:isValidEnd(path)
        if StringValidationUtil.getInstance():isEmpty(path) then
            return false
        end
        if string.sub(path, (#path - 1) + 1, (#path - 1) + 1) == self.abPathData.SEPARATORCHAR then
            return true
        else
            return false
        end
end


function AbPathUtilOld:adjustStart(path)
        if not self:isValidStart(path) then
            path = tostring(self.abPathData.SEPARATOR) .. path
        end
        return path
end


function AbPathUtilOld:adjustEnd(path)
        if not self:isValidEnd(path) then
            path = path .. tostring(self.abPathData.SEPARATOR)
        end
        return path
end


function AbPathUtilOld:adjust(path)
        if StringValidationUtil.getInstance():isEmpty(path) then
            return self.abPathData.SEPARATOR
        end
        if ((string.find(path, "\\", 1, true) or 0) - 1) >= 0 then
            path = path:replace("\\", self.abPathData.SEPARATORCHAR)
        end
        return path
end


function AbPathUtilOld:getNameFromPath(categoryPath)
        local endIndex = categoryPath:lastIndexOf(self.abPathData.SEPARATOR)
        if endIndex < 0 then
            endIndex = categoryPath:lastIndexOf(self.filePathData.SEPARATORCHAR)
        end
        if endIndex < 0 then
            return categoryPath
        end
        if #categoryPath == endIndex + 1 then
            local categoryName = string.sub(categoryPath, (0) + 1, endIndex)
            return self:getNameFromPath(categoryName)
        else
            local categoryName = string.sub(categoryPath, (endIndex + 1) + 1)
            return categoryName
        end
end


-- throws Exception
function AbPathUtilOld:removeNameFromPath(categoryPath)
        local endIndex = categoryPath:lastIndexOf(self.abPathData.SEPARATOR)
        if endIndex < 0 then
            endIndex = categoryPath:lastIndexOf(self.filePathData.SEPARATORCHAR)
        end
        if endIndex < 0 then
            return AbPath.createAbPath()
        end
        if #categoryPath == endIndex + 1 then
            return self:removeNameFromPath(string.sub(categoryPath, (0) + 1, endIndex - 1))
        else
            local categoryName = string.sub(categoryPath, (0) + 1, endIndex)
            return AbPath.new(categoryName, StringUtil.getInstance().EMPTY_STRING)
        end
end

AbPathUtilOld.instance = AbPathUtilOld.new()
AbPathUtilOld.MIN = 4

return AbPathUtilOld

