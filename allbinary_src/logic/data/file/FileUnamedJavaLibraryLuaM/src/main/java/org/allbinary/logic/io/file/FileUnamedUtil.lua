-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2025 AllBinary 
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

local FileUnamedUtil = {}
package.loaded["org.allbinary.logic.io.file.FileUnamedUtil"] = FileUnamedUtil

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

-- class table FileUnamedUtil is declared before the requires
FileUnamedUtil.__index = FileUnamedUtil
FileUnamedUtil.className = "FileUnamedUtil"
FileUnamedUtil.javaClassName = "org.allbinary.logic.io.file.FileUnamedUtil"

function FileUnamedUtil:_init_fields()
    self.commonSeps = CommonSeps.getInstance()
end

function FileUnamedUtil._jinit(self)
    FileUnamedUtil._init_fields(self)
    return self
end

function FileUnamedUtil.new()
    return FileUnamedUtil._jinit(setmetatable({}, FileUnamedUtil))
end


function FileUnamedUtil.getInstance()
        return FileUnamedUtil.instance_f
end


function FileUnamedUtil:process(string_)
        local simplifiedString = string.lower(string_)
        simplifiedString = simplifiedString:replace(self.commonSeps.SPACE, self.commonSeps.UNDERSCORE)
        simplifiedString = simplifiedString:replace(self.commonSeps.DASH, self.commonSeps.UNDERSCORE)
        return simplifiedString
end

FileUnamedUtil.instance_f = FileUnamedUtil.new()

return FileUnamedUtil

