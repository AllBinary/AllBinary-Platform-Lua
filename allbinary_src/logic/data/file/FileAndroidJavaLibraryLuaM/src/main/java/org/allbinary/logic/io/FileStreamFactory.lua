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

local Context = java_lazy("android.content.Context")
local ResourceUtil = java_lazy("org.allbinary.data.resource.ResourceUtil")
local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
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

function FileStreamFactory:_init_fields()
    if self.context == nil then self.context = nil end
end


function FileStreamFactory.getInstance()
        if FileStreamFactory.SINGLETON == NullUtil.getInstance().NULL_OBJECT then
            FileStreamFactory.SINGLETON = FileStreamFactory.new(ResourceUtil.getInstance():getContext())
        end
        return FileStreamFactory.SINGLETON
end


function FileStreamFactory._jinit(self, context)
    FileStreamFactory._init_fields(self)
        self.context = context
    return self
end

function FileStreamFactory.new(...)
    local self = setmetatable({}, FileStreamFactory)
    FileStreamFactory._jinit(self, ...)
    return self
end


-- throws Exception
function FileStreamFactory:getFileInputStreamInstance(path, fileName)
        return AbFileInputStream.new(self:getContext():openFileInput(fileName))
end


-- throws Exception
function FileStreamFactory:getFileOutputStreamInstance(path, fileName)
        local context = self:getContext()
        context:deleteFile(fileName)
        return AbFileOutputStream.new(context:openFileOutput(fileName, 0))
end


-- throws Exception
function FileStreamFactory:delete(path, fileName)
        self:getContext():deleteFile(fileName)
end


function FileStreamFactory:getContext()
        return self.context
end

FileStreamFactory.SINGLETON = NullUtil.getInstance().NULL_OBJECT

return FileStreamFactory

