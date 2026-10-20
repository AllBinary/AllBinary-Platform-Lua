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

-- local DataInputStream = require("java.io.DataInputStream")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")

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

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local LineReader = {}
LineReader.__index = LineReader
LineReader.className = "LineReader"

function LineReader:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.fileName = nil
    self.string = nil
    self.index = 0
    self.idFile = nil
    self.idData = nil
end


function LineReader.new(fileName)
    local self = setmetatable({}, LineReader)
    self:_init_fields()
        local try_ok, try_error = pcall(function()
            local bytes = java_new_array(0, 100000)
            self.fileName = fileName
            self.idFile = AbFileInputStream.new(fileName)
            self.idFile:read(bytes)
            self.string = string.char(table.unpack(bytes))
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put("File: " .. fileName, self, "LineReader", e)
            do
            end
        end
    return self
end


function LineReader:hasNext()
        local try_ok, try_error = pcall(function()
            local nextIndex = ((string.find(self.string, CommonSeps.getInstance().NEW_LINE, (self.index) + 1, true) or 0) - 1)
            if nextIndex == -1 then
                return false
            end
            return true
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "hasNext", e)
            do
            end
            return false
        end
end


-- throws Exception
function LineReader:next()
        local try_ok, try_error = pcall(function()
            local nextIndex = ((string.find(self.string, CommonSeps.getInstance().NEW_LINE, (self.index) + 1, true) or 0) - 1)
            if nextIndex == -1 then
                error(java_exception("Exception", "next() should have been called first"), 0)
            end
            local temp = string.sub(self.string, (self.index) + 1, nextIndex)
            self.index = nextIndex + 1
            return temp
        end)
        if not try_ok then
            local e = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "next", e)
            do
            end
            error(e, 0)
        end
end

return LineReader

