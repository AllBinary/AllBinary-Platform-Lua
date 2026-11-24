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

local FileData = {}
package.loaded["org.allbinary.logic.io.file.FileData"] = FileData

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

-- class table FileData is declared before the requires
FileData.__index = FileData
FileData.className = "FileData"
FileData.javaClassName = "org.allbinary.logic.io.file.FileData"

function FileData:_init_fields()
    self.NAME = "FILE_NAME"
    self.ISFILE = "FILE_ISFILE"
    self.ISDIRECTORY = "FILE_ISDIRECTORY"
    self.ISHIDDEN = "FILE_ISHIDDEN"
    self.ISABSOLUTE = "FILE_ISABSOLUTE"
    self.ROOT_NAME = "FILE_ROOT_NAME"
    self.PATH = "FILE_PATH"
    self.ABSOLUTE_PATH = "FILE_ABSOLUTE_PATH"
    self.CANONICAL_PATH = "FILE_CANONICAL_PATH"
    self.PARENT = "FILE_PARENT"
    self.MINLEN = 1
    self.MAXLEN = 120
    self.MAXIMAGEFILESIZE = 1048576
    self.MINIMAGEFILESIZE = 32
    self.MAXDOWNLOADABLEFILESIZE = 1048576 * 20
    self.MINDOWNLOADABLEFILESIZE = 1
end


function FileData.getInstance()
        return FileData.instance_f
end


function FileData._jinit(self)
    FileData._init_fields(self)
    return self
end

function FileData.new(...)
    local self = setmetatable({}, FileData)
    FileData._jinit(self, ...)
    return self
end

FileData.instance_f = FileData.new()

return FileData

