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

-- local FilenameFilter = require("java.io.FilenameFilter")
-- local IOException = require("java.io.IOException")
-- local URI = require("java.net.URI")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local AbFileInterface = {}
AbFileInterface.__index = AbFileInterface
AbFileInterface.className = "AbFileInterface"


function AbFileInterface:canRead()
    error("abstract method canRead")
end


function AbFileInterface:canWrite()
    error("abstract method canWrite")
end


-- throws IOException
function AbFileInterface:createNewFile()
    error("abstract method createNewFile")
end


-- throws IOException
function AbFileInterface:delete()
    error("abstract method delete")
end


function AbFileInterface:deleteOnExit()
    error("abstract method deleteOnExit")
end


function AbFileInterface:exists()
    error("abstract method exists")
end


function AbFileInterface:getAbsolutePath()
    error("abstract method getAbsolutePath")
end


-- throws IOException
function AbFileInterface:getCanonicalPath()
    error("abstract method getCanonicalPath")
end


function AbFileInterface:getParent()
    error("abstract method getParent")
end


function AbFileInterface:getPath()
    error("abstract method getPath")
end


function AbFileInterface:isAbsolute()
    error("abstract method isAbsolute")
end


function AbFileInterface:isDirectory()
    error("abstract method isDirectory")
end


function AbFileInterface:isFile()
    error("abstract method isFile")
end


function AbFileInterface:isHidden()
    error("abstract method isHidden")
end


function AbFileInterface:lastModified()
    error("abstract method lastModified")
end


function AbFileInterface:length()
    error("abstract method length")
end


function AbFileInterface:list()
    error("abstract method list")
end


function AbFileInterface:listWithFilter(filter)
    error("abstract method listWithFilter")
end


function AbFileInterface:mkdir()
    error("abstract method mkdir")
end


function AbFileInterface:mkdirs()
    error("abstract method mkdirs")
end


function AbFileInterface:setLastModified(time)
    error("abstract method setLastModified")
end


function AbFileInterface:setReadOnly()
    error("abstract method setReadOnly")
end


function AbFileInterface:toString()
    error("abstract method toString")
end
AbFileInterface.__tostring = function(self) return self:toString() end


function AbFileInterface:toURI()
    error("abstract method toURI")
end

return AbFileInterface

