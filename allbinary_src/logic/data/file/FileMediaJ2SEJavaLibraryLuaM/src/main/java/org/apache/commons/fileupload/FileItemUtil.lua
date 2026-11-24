-- Generated Code Do Not Modify
-- package org.apache.commons.fileupload

local FileItemUtil = {}
package.loaded["org.apache.commons.fileupload.FileItemUtil"] = FileItemUtil

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

local ByteArrayOutputStream = java_lazy("java.io.ByteArrayOutputStream")
-- local InputStream = require("java.io.InputStream")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StreamUtil = java_lazy("org.allbinary.logic.io.StreamUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local AbFileNativeUtil = java_lazy("org.allbinary.logic.io.file.AbFileNativeUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
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

-- class table FileItemUtil is declared before the requires
FileItemUtil.__index = FileItemUtil
FileItemUtil.className = "FileItemUtil"
FileItemUtil.javaClassName = "org.apache.commons.fileupload.FileItemUtil"

function FileItemUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.DEFAULT_CHARSET = "ISO-8859-1"
end

function FileItemUtil._jinit(self)
    FileItemUtil._init_fields(self)
    return self
end

function FileItemUtil.new()
    return FileItemUtil._jinit(setmetatable({}, FileItemUtil))
end


function FileItemUtil.getInstance()
        return FileItemUtil.instance_f
end


-- throws Exception
function FileItemUtil:getString_j1_1(byteArray)
        return string.char(table.unpack(byteArray, self.DEFAULT_CHARSET))
end


-- throws Exception
function FileItemUtil:getString_j1_2(fileItem)
        return String.new(self:getBytes(fileItem), self.DEFAULT_CHARSET)
end
function FileItemUtil:getString(...)
    local count = select("#", ...)
    if count == 1 then return self:getString_j1(...) end
    error("No method getString takes " .. count .. " arguments")
end
FileItemUtil.getString__jdispatcher = FileItemUtil.getString
function FileItemUtil:getString_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or (type(java_a1) == "table" and getmetatable(java_a1) == nil and (java_a1.jt == nil or java_a1.jt == "B") and (java_a1[1] == nil or math.type(java_a1[1]) == "integer"))) then return FileItemUtil.getString_j1_1(self, ...) end
    return FileItemUtil.getString_j1_2(self, ...)
end


-- throws Exception
function FileItemUtil:getBytes(fileItem)
        local streamUtil = StreamUtil.getInstance()
        local inputStream = nil
        local outputStream = nil
        local try_ok, try_error, try_value = pcall(function()
            inputStream = fileItem:openStream()
            outputStream = require("java.io.ByteArrayOutputStream").new()
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
            outputStream = streamUtil:get(inputStream, outputStream, java_typed_array("B", java_new_array(0, 16384)))
            do return "__jreturn", outputStream:toByteArray() end
        end)
        do -- finally
            streamUtil:close(outputStream)
            streamUtil:close(inputStream)
        end
        if not try_ok then error(try_error, 0) end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function FileItemUtil:write(fileItem, file)
        fileItem:write(AbFileNativeUtil.get(file))
end

FileItemUtil.instance_f = FileItemUtil.new()

return FileItemUtil

