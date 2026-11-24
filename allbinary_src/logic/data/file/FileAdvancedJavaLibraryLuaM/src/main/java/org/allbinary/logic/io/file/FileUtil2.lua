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
-- package org.allbinary.logic.io.file

local FileUtil2 = {}
package.loaded["org.allbinary.logic.io.file.FileUtil2"] = FileUtil2

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbFileInputStream = java_lazy("org.allbinary.logic.io.AbFileInputStream")
local StreamUtil = java_lazy("org.allbinary.logic.io.StreamUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")

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

-- class table FileUtil2 is declared before the requires
FileUtil2.__index = FileUtil2
FileUtil2.className = "FileUtil2"
FileUtil2.javaClassName = "org.allbinary.logic.io.file.FileUtil2"

function FileUtil2:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.streamUtil = StreamUtil.getInstance()
end


function FileUtil2.getInstance()
        return FileUtil2.instance_f
end


function FileUtil2._jinit(self)
    FileUtil2._init_fields(self)
    return self
end

function FileUtil2.new(...)
    local self = setmetatable({}, FileUtil2)
    FileUtil2._jinit(self, ...)
    return self
end


function FileUtil2:loadFileAsList(file, max, byteArray1)
        local inputStream = nil
        local try_ok, try_error, try_value = pcall(function()
            inputStream = AbFileInputStream.createFromAbFile(file)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.ADD, e)
        end
        return SimpleFileUtil.getInstance():loadFileAsList(inputStream, max, byteArray1)
end

FileUtil2.instance_f = FileUtil2.new()

return FileUtil2

