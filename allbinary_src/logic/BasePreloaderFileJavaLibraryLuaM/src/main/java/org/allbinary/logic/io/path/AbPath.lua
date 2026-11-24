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

local AbPath = {}
package.loaded["org.allbinary.logic.io.path.AbPath"] = AbPath

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
local FilePathUtil = java_lazy("org.allbinary.logic.io.file.FilePathUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local PathUtil = java_lazy("org.allbinary.logic.io.path.PathUtil")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table AbPath is declared before the requires
AbPath.__index = AbPath
AbPath.className = "AbPath"
AbPath.javaClassName = "org.allbinary.logic.io.path.AbPath"

function AbPath:_init_fields()
    self.commonSeps = CommonSeps.getInstance()
    self.abPathData = AbPathData.getInstance()
    self.abPathUtil = PathUtil.getInstance()
    self.EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
    self.schema = self.EMPTY_STRING
    self.path = self.EMPTY_STRING
    self.nameP = self.EMPTY_STRING
    self.hasSchemaP = false
    self.numberOfSeps = 0
end


function AbPath.createAbPath()
        local try_ok, try_error, try_value = pcall(function()
            local EMPTY_STRING = StringUtil.getInstance().EMPTY_STRING
            do return "__jreturn", AbPath.new(EMPTY_STRING, EMPTY_STRING) end
        end)
        if not try_ok then
            local ex = try_error
            if type(ex) ~= "table" then ex = require("java.lang.RuntimeException").new(tostring(ex)) end
            error(require("java.lang.RuntimeException").new(), 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function AbPath._jinit(self, aPath, name)
    AbPath._init_fields(self)
        local stringValidationUtil = StringValidationUtil.getInstance()
        if not stringValidationUtil:isEmpty(aPath) then
            self.schema = self:getSchema(aPath)
            self.nameP = name
            self.path = self.abPathUtil:adjustEnd(self.abPathUtil:adjust(self:getPathFromPath(aPath)))
        else
            self:init()
            if not stringValidationUtil:isEmpty(name) then
                self.nameP = name
            end
        end
    return self
end

function AbPath.new(...)
    local self = setmetatable({}, AbPath)
    AbPath._jinit(self, ...)
    return self
end


function AbPath:init()
        self.schema = self.EMPTY_STRING
        self:setPath(self.abPathData.SEPARATOR)
        self.nameP = self.EMPTY_STRING
end


function AbPath:getSchema(aPath)
        local beginIndex = ((string.find(aPath, self.commonSeps.COLON, 1, true) or 0) - 1)
        if beginIndex >= 0 then
            self.hasSchemaP = true
            return string.sub(aPath, (0) + 1, beginIndex)
        end
        self.hasSchemaP = false
        return self.EMPTY_STRING
end


function AbPath:hasSchema()
        return self.hasSchemaP
end


-- throws Exception
function AbPath:getPathFromPath(aPath)
        local filePathData = FilePathData.getInstance()
        local tempPath = aPath
        if not self:hasSchema() then
            tempPath = self.abPathUtil:adjustStart(tempPath)
        else
            local beginIndex = ((string.find(tempPath, self.commonSeps.COLON, 1, true) or 0) - 1)
            if beginIndex >= 0 then
                beginIndex = beginIndex + 1
                while string.sub(tempPath, (beginIndex) + 1, (beginIndex) + 1) == self.abPathData.SEPARATORCHAR or string.sub(tempPath, (beginIndex) + 1, (beginIndex) + 1) == filePathData.SEPARATORCHAR do
                    beginIndex = beginIndex + 1
                    self.numberOfSeps = self.numberOfSeps + 1
                    if self.numberOfSeps > 2 then
                        error(require("java.lang.Exception").new("Should Not Have More Than Two Seps"), 0)
                    end
                end
                tempPath = string.sub(tempPath, (beginIndex) + 1, #tempPath)
            end
        end
        return tempPath
end


function AbPath:setName(name)
        self.nameP = name
end


function AbPath:getName()
        return self.nameP
end


function AbPath:toString()
        local stringBuffer = StringMaker.new()
        if self:hasSchema() then
            stringBuffer:append(self.schema)
            stringBuffer:append(AbPath.NETWORK_SEP)
        end
        stringBuffer:append(self:getPath())
        stringBuffer:append(self.nameP)
        return tostring(stringBuffer)
end
AbPath.__tostring = function(self) return self:toString() end


function AbPath:toFileSystemString()
        if self:hasSchema() then
            local filePathData = FilePathData.getInstance()
            local stringBuffer = StringMaker.new()
            stringBuffer:append(self.schema)
            stringBuffer:append(self.commonSeps.COLON)
            stringBuffer:append(filePathData.PATH_START)
            stringBuffer:append(FilePathUtil.adjust(self:getPath()))
            stringBuffer:append(self.nameP)
            return tostring(stringBuffer)
        else
            return tostring(FilePathUtil.adjust(self:getPath())) .. self.nameP
        end
end


function AbPath:getPath()
        return self.path
end


function AbPath:setPath(path)
        self.path = path
end

AbPath.NETWORK_SEP = ":/"

return AbPath

