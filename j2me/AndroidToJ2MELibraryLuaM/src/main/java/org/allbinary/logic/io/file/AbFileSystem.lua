-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2026 AllBinary 
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
-- package org.allbinary.logic.io.file

local AbFileSystem = {}
package.loaded["org.allbinary.logic.io.file.AbFileSystem"] = AbFileSystem

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

local File = java_lazy("java.io.File")
local FileInputStream = java_lazy("java.io.FileInputStream")
local InputStream = java_lazy("java.io.InputStream")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

--AndroidToJ2ME
-- class table AbFileSystem is declared before the requires
AbFileSystem.__index = AbFileSystem
AbFileSystem.className = "AbFileSystem"
AbFileSystem.javaClassName = "org.allbinary.logic.io.file.AbFileSystem"

function AbFileSystem:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end

function AbFileSystem._jinit(self)
    AbFileSystem._init_fields(self)
    return self
end

function AbFileSystem.new()
    return AbFileSystem._jinit(setmetatable({}, AbFileSystem))
end


function AbFileSystem.getInstance()
        return AbFileSystem.instance_f
end


function AbFileSystem:isDirectoryOrFile(path)
        local file = File.new(path)
        return file:isDirectory() or file:isFile()
end


function AbFileSystem:isDirectory(path)
        return File.new(path):isDirectory()
end


function AbFileSystem:getFilesAsStringArrayForPath(currentDirPath)
        local file = File.new(currentDirPath)
        if file:exists() then
            return file:list()
        else
            return StringUtil.getInstance():getArrayInstance()
        end
end


function AbFileSystem:readAsString_j1(fileName)
        local bytes = java_typed_array("B", java_new_array(0, 1000000))
        return self:readAsString(fileName, bytes)
end


function AbFileSystem:readAsString_j2(fileName, bytes)
        local closeable = NullUtil.getInstance().NULL_OBJECT
        local try_ok, try_error, try_value = pcall(function()
            local idFile = FileInputStream.new(fileName)
            closeable = idFile
            local size = idFile:read(bytes)
            if size > 0 then
                do return "__jreturn", string.char(table.unpack(bytes, 0, size)) end
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, "readAsString", e)
        end
        do -- finally
            self:close(closeable)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
        return StringUtil.getInstance().EMPTY_STRING
end
function AbFileSystem:readAsString(...)
    local count = select("#", ...)
    if count == 1 then return self:readAsString_j1(...) end
    if count == 2 then return self:readAsString_j2(...) end
    error("No method readAsString takes " .. count .. " arguments")
end
AbFileSystem.readAsString__jdispatcher = AbFileSystem.readAsString


function AbFileSystem:close(closeable)
        local try_ok, try_error, try_value = pcall(function()
            if not rawequal(closeable, nil) then
                local inputStream = (closeable)
                inputStream:close()
            end
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.CLOSE, e)
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

AbFileSystem.instance_f = AbFileSystem.new()

return AbFileSystem

