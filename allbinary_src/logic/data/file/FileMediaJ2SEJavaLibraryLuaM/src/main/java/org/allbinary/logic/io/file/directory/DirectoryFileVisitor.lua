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

-- local File = require("java.io.File")
-- local FileFilter = require("java.io.FileFilter")
local VisitorInterface = require("org.allbinary.logic.util.visitor.VisitorInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DirectoryFileVisitor = {}
DirectoryFileVisitor.__index = DirectoryFileVisitor
DirectoryFileVisitor.className = "DirectoryFileVisitor"


function DirectoryFileVisitor.new()
    local self = setmetatable({}, DirectoryFileVisitor)
    return self
end


function DirectoryFileVisitor:accept(arg0)
        return (self:visit(arg0))
end


function DirectoryFileVisitor:visit(anyType)
        local file = anyType
        local index = 1
        local aFile = file:getParentFile()
        while ((function() aFile = aFile:getParentFile() return aFile end)()) ~= nil do
            index = index + 1
        end
        if file:isDirectory() and index < 5 then
            return true
        end
        return false
end

return DirectoryFileVisitor

