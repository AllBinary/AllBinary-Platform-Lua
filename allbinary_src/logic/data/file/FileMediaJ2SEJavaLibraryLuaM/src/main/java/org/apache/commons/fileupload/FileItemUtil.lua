-- Generated Code Do Not Modify
-- package org.apache.commons.fileupload

-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local InputStream = require("java.io.InputStream")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local AbFileNativeUtil = require("org.allbinary.logic.io.file.AbFileNativeUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

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

local FileItemUtil = {}
FileItemUtil.__index = FileItemUtil
FileItemUtil.className = "FileItemUtil"

function FileItemUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.DEFAULT_CHARSET = "ISO-8859-1"
end

function FileItemUtil.new()
    local self = setmetatable({}, FileItemUtil)
    self:_init_fields()
    return self
end


function FileItemUtil.getInstance()
        return FileItemUtil.instance
end


-- throws Exception
function FileItemUtil:getString(byteArray)
        return string.char(table.unpack(byteArray, self.DEFAULT_CHARSET))
end


-- throws Exception
-- Java overloaded method: Lua keeps the last definition
function FileItemUtil:getString(fileItem)
        return String.new(self:getBytes(fileItem), self.DEFAULT_CHARSET)
end


-- throws Exception
function FileItemUtil:getBytes(fileItem)
        local streamUtil = StreamUtil.getInstance()
        local inputStream = nil
        local outputStream = nil
        local try_ok, try_error = pcall(function()
            inputStream = fileItem:openStream()
            outputStream = java_byte_array_output_stream()
            if fileItem:isFormField() then
                self.logUtil:putF("FileItemStream FieldName: " .. tostring(fileItem:getFieldName()), self, "write()")
            else
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Uploaded File FieldName: ")
                stringBuffer:append(fileItem:getFieldName())
                stringBuffer:append(" name = ")
                stringBuffer:append(fileItem:getName())
                self.logUtil:putF(tostring(stringBuffer), self, "write()")
            end
            outputStream = streamUtil:get(inputStream, outputStream, java_new_array(0, 16384))
            return outputStream:toByteArray()
        end)
        do -- finally
            streamUtil:close(outputStream)
            streamUtil:close(inputStream)
        end
        if not try_ok then error(try_error, 0) end
end


-- throws Exception
function FileItemUtil:write(fileItem, file)
        fileItem:write(AbFileNativeUtil.get(file))
end

FileItemUtil.instance = FileItemUtil.new()

return FileItemUtil

