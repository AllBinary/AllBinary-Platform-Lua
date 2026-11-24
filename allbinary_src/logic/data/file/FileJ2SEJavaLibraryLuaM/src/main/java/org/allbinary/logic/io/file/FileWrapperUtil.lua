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
-- package org.allbinary.logic.io.file

local FileWrapperUtil = {}
package.loaded["org.allbinary.logic.io.file.FileWrapperUtil"] = FileWrapperUtil

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
local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")

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

-- class table FileWrapperUtil is declared before the requires
FileWrapperUtil.__index = FileWrapperUtil
FileWrapperUtil.className = "FileWrapperUtil"
FileWrapperUtil.javaClassName = "org.allbinary.logic.io.file.FileWrapperUtil"

function FileWrapperUtil._jinit(self)
    return self
end

function FileWrapperUtil.new()
    return FileWrapperUtil._jinit(setmetatable({}, FileWrapperUtil))
end


function FileWrapperUtil.wrapFiles(files)
        local try_ok, try_error, try_value = pcall(function()
            local abFileArray = java_new_array(nil, (files.n or #files))
            for index = (files.n or #files) - 1, 0, -1 do
                abFileArray[index + 1] = AbFile.new(files[index + 1])
            end
            do return "__jreturn", abFileArray end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            PreLogUtil.putSE("Exception Wrapping Files", "FileWrapperUtil", "wrapFiles", e)
            return java_new_array(nil, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function FileWrapperUtil.wrapFile(file)
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", AbFile.new(file) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            PreLogUtil.putSE("Exception Wrapping File", "FileWrapperUtil", "wrapFile", e)
            return AbFile.NULL_FILE
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return FileWrapperUtil

