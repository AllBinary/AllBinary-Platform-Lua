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

local PathUtil = {}
package.loaded["org.allbinary.logic.io.path.PathUtil"] = PathUtil

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
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local AbFilePath = java_lazy("org.allbinary.logic.io.path.AbFilePath")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")

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

--Used to correct user input for paths
-- class table PathUtil is declared before the requires
PathUtil.__index = PathUtil
PathUtil.className = "PathUtil"
PathUtil.javaClassName = "org.allbinary.logic.io.path.PathUtil"

function PathUtil:_init_fields()
    self.abPathData = AbPathData.getInstance()
    self.filePathData = FilePathData.getInstance()
end


function PathUtil.getInstance()
        return PathUtil.instance_f
end


function PathUtil._jinit(self)
    PathUtil._init_fields(self)
    return self
end

function PathUtil.new(...)
    local self = setmetatable({}, PathUtil)
    PathUtil._jinit(self, ...)
    return self
end


function PathUtil:getExtensionWithAbFilePath(abFilePath)
        return self.abPathData:getExtension(tostring(abFilePath))
end


function PathUtil:getExtensionWithAbPath(abPath)
        return self.abPathData:getExtension(tostring(abPath))
end


-- throws Exception
function PathUtil:getWithoutExtensionWithAbFilePath(abFilePath)
        return self:getWithoutExtension(tostring(abFilePath))
end


-- throws Exception
function PathUtil:getWithoutExtensionWithAbPath(abPath)
        return self:getWithoutExtension(tostring(abPath))
end


-- throws Exception
function PathUtil:getWithoutExtension(filePath)
        local indexOfFileExtensionDelmiter = self.abPathData:getExtensionIndex(filePath)
        local pathWithoutExtension = filePath
        if indexOfFileExtensionDelmiter >= 0 then
            pathWithoutExtension = string.sub(filePath, (0) + 1, indexOfFileExtensionDelmiter)
        end
        return pathWithoutExtension
end


function PathUtil:isValid(path)
        if self:isValidStart(path) then
            if self:isValidEnd(path) then
                return true
            end
        end
        return false
end


function PathUtil:isValidStart(path)
        if rawequal(string.sub(path, (0) + 1, (0) + 1), self.abPathData.SEPARATORCHAR) or rawequal(string.sub(path, (0) + 1, (0) + 1), ".") then
            return true
        else
            return false
        end
end


function PathUtil:isValidEnd(path)
        local stringValidationUtil = StringValidationUtil.getInstance()
        if stringValidationUtil:isEmpty(path) then
            return false
        end
        if rawequal(string.sub(path, (#path - 1) + 1, (#path - 1) + 1), self.abPathData.SEPARATORCHAR) then
            return true
        else
            return false
        end
end


function PathUtil:adjustStart(path)
        if not (self:isValidStart(path)) then
            path = require("allbinary_java").to_string(self.abPathData.SEPARATOR) .. require("allbinary_java").to_string(path)
        end
        return path
end


function PathUtil:adjustEnd(path)
        if not (self:isValidEnd(path)) then
            path = require("allbinary_java").to_string(path) .. require("allbinary_java").to_string(self.abPathData.SEPARATOR)
        end
        return path
end


function PathUtil:adjust(path)
        local stringValidationUtil = StringValidationUtil.getInstance()
        if stringValidationUtil:isEmpty(path) then
            return self.abPathData.SEPARATOR
        end
        if ((string.find(path, "\\", 1, true) or 0) - 1) >= 0 then
            path = path:replace("\\", self.abPathData.SEPARATORCHAR)
        end
        return path
end


-- throws Exception
function PathUtil:removeNameFromPath(path)
        local endIndex = path:lastIndexOf(self.abPathData.SEPARATOR)
        if endIndex < 0 then
            endIndex = path:lastIndexOf(self.filePathData.SEPARATORCHAR)
        end
        if endIndex < 0 then
            return AbPath.createAbPath()
        end
        if rawequal(#path, endIndex + 1) then
            return self:removeNameFromPath(string.sub(path, (0) + 1, endIndex - 1))
        else
            local pathWithoutName = string.sub(path, (0) + 1, endIndex)
            return AbPath.new(pathWithoutName, StringUtil.getInstance().EMPTY_STRING)
        end
end

PathUtil.instance_f = PathUtil.new()

return PathUtil

