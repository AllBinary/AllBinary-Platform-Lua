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

local FileStreamFactory = {}
package.loaded["org.allbinary.logic.io.FileStreamFactory"] = FileStreamFactory

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

local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbFileInputStream = java_lazy("org.allbinary.logic.io.AbFileInputStream")
local AbFileOutputStream = java_lazy("org.allbinary.logic.io.AbFileOutputStream")

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

-- class table FileStreamFactory is declared before the requires
FileStreamFactory.__index = FileStreamFactory
FileStreamFactory.className = "FileStreamFactory"
FileStreamFactory.javaClassName = "org.allbinary.logic.io.FileStreamFactory"


function FileStreamFactory.getInstance()
        if rawequal(FileStreamFactory.SINGLETON, NullUtil.getInstance().NULL_OBJECT) then
            FileStreamFactory.SINGLETON = FileStreamFactory.new()
        end
        return FileStreamFactory.SINGLETON
end


function FileStreamFactory._jinit(self)
    return self
end

function FileStreamFactory.new(...)
    local self = setmetatable({}, FileStreamFactory)
    FileStreamFactory._jinit(self, ...)
    return self
end


-- throws Exception
function FileStreamFactory:getFileInputStreamInstance(path, fileName)
        local FILEABPATH = AbPath.new(path, fileName)
        local file = AbFile.createAbFileFromAbPath(FILEABPATH)
        return AbFileInputStream.createFromAbFile(file)
end


-- throws Exception
function FileStreamFactory:getFileOutputStreamInstance(path, fileName)
        local FILEABPATH = AbPath.new(path, fileName)
        local file = AbFile.createAbFileFromAbPath(FILEABPATH)
        if file:exists() then
            file:delete()
            file:createNewFile()
        end
        return AbFileOutputStream.createFromAbFile(file)
end


-- throws Exception
function FileStreamFactory:delete(path, fileName)
        local FILEABPATH = AbPath.new(path, fileName)
        local file = AbFile.createAbFileFromAbPath(FILEABPATH)
        file:delete()
end

FileStreamFactory.SINGLETON = NullUtil.getInstance().NULL_OBJECT

return FileStreamFactory

