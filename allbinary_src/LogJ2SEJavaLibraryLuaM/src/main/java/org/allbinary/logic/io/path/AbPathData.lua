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

local AbPathData = {}
package.loaded["org.allbinary.logic.io.path.AbPathData"] = AbPathData

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

local FilePathData = java_lazy("org.allbinary.logic.io.file.FilePathData")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")

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

-- class table AbPathData is declared before the requires
AbPathData.__index = AbPathData
AbPathData.className = "AbPathData"
AbPathData.javaClassName = "org.allbinary.logic.io.path.AbPathData"

function AbPathData:_init_fields()
    self.EXTENSION_SEP = CommonSeps.getInstance().PERIOD
    self.SEPARATORCHAR = "/"
    self.SEPARATOR = CommonSeps.getInstance().FORWARD_SLASH
end


function AbPathData.getInstance()
        return AbPathData.instance_f
end


function AbPathData._jinit(self)
    AbPathData._init_fields(self)
    return self
end

function AbPathData.new(...)
    local self = setmetatable({}, AbPathData)
    AbPathData._jinit(self, ...)
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
        if rawequal(#path, endIndex + 1) then
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
        if rawequal(#path, endIndex + 1) then
            return self:removeNameFromPath(string.sub(path, (0) + 1, endIndex - 1))
        else
            local pathWithoutName = string.sub(path, (0) + 1, endIndex)
            return pathWithoutName
        end
end

AbPathData.instance_f = AbPathData.new()

return AbPathData

