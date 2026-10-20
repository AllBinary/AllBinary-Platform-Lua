--
-- AllBinary Open License Version 1
-- Copyright (c) 2022 AllBinary
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
-- package org.allbinary.data.tree.dom

-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local StreamResult = require("javax.xml.transform.stream.StreamResult")
-- local StreamSource = require("javax.xml.transform.stream.StreamSource")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local AbPath = require("org.allbinary.logic.io.path.AbPath")

-- Java library java.io.ByteArrayOutputStream
local function java_byte_array_output_stream()
    local stream = {buffer = {}}
    function stream:write(value, offset, length)
        if type(value) == "table" then
            local first = (offset or 0) + 1
            local last = first + (length or #value) - 1
            for index = first, last do self.buffer[#self.buffer + 1] = string.char(value[index] % 256) end
        elseif type(value) == "number" then
            self.buffer[#self.buffer + 1] = string.char(value % 256)
        else
            self.buffer[#self.buffer + 1] = tostring(value)
        end
    end
    function stream:toString() return table.concat(self.buffer) end
    function stream:size() return #table.concat(self.buffer) end
    function stream:reset() self.buffer = {} end
    function stream:flush() end
    function stream:close() end
    return setmetatable(stream, {__tostring = function(self) return table.concat(self.buffer) end})
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

local AbXslHelper = {}
AbXslHelper.__index = AbXslHelper
AbXslHelper.className = "AbXslHelper"

function AbXslHelper.new()
    local self = setmetatable({}, AbXslHelper)
    return self
end


function AbXslHelper.getInstance()
        return AbXslHelper.instance
end


-- throws Exception
function AbXslHelper:translate(xslFile, xmlFile)
        return self:translate(xslFile:getAbsolutePath(), xmlFile:getAbsolutePath())
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function AbXslHelper:translate(xslPath, xmlPath)
        return self:translate(xslPath:getPath(), xmlPath:getPath())
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function AbXslHelper:translate(xsltFilePath, xmlFilePath)
        local try_ok, try_error = pcall(function()
            local outputStream = java_byte_array_output_stream()
            return tostring(XslHelper.getInstance():translate(StreamSource.new(xsltFilePath), StreamSource.new(xmlFilePath), StreamResult.new(outputStream)))
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
end

AbXslHelper.instance = AbXslHelper.new()

return AbXslHelper

