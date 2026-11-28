-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2002 AllBinary 
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
-- package org.allbinary.logic.io.file.directory

local DirectoryFileVisitor = {}
package.loaded["org.allbinary.logic.io.file.directory.DirectoryFileVisitor"] = DirectoryFileVisitor

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
-- local FileFilter = require("java.io.FileFilter")
local VisitorInterface = java_lazy("org.allbinary.logic.util.visitor.VisitorInterface")

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

-- class table DirectoryFileVisitor is declared before the requires
DirectoryFileVisitor.__index = DirectoryFileVisitor
DirectoryFileVisitor.className = "DirectoryFileVisitor"
DirectoryFileVisitor.javaClassName = "org.allbinary.logic.io.file.directory.DirectoryFileVisitor"
DirectoryFileVisitor.java_implements = " VisitorInterface FileFilter "
DirectoryFileVisitor.java_interfaces = function() return {VisitorInterface, FileFilter} end


function DirectoryFileVisitor._jinit(self)
    return self
end

function DirectoryFileVisitor.new(...)
    local self = setmetatable({}, DirectoryFileVisitor)
    DirectoryFileVisitor._jinit(self, ...)
    return self
end


function DirectoryFileVisitor:accept(arg0)
        return (self:visit(arg0))
end


function DirectoryFileVisitor:visit(anyType)
        local file = anyType
        local index = 1
        local aFile = file:getParentFile()
        while not rawequal(((function() aFile = aFile:getParentFile() return aFile end)()), nil) do
            index = index + 1
        end
        if file:isDirectory() and index < 5 then
            return true
        end
        return false
end

return DirectoryFileVisitor

