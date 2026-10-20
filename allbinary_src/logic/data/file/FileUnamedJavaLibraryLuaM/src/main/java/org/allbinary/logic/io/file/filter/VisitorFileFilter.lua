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
-- package org.allbinary.logic.io.file.filter

-- local File = require("java.io.File")
-- local FileFilter = require("java.io.FileFilter")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local FileWrapperUtil = require("org.allbinary.logic.io.file.FileWrapperUtil")
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

local VisitorFileFilter = {}
VisitorFileFilter.__index = VisitorFileFilter
VisitorFileFilter.className = "VisitorFileFilter"

function VisitorFileFilter:_init_fields()
    self.booleanVisitorInterface = nil
end


function VisitorFileFilter.new(booleanVisitorInterface)
    local self = setmetatable({}, VisitorFileFilter)
    self:_init_fields()
        self.booleanVisitorInterface = booleanVisitorInterface
    return self
end


function VisitorFileFilter:accept(file)
        local abFile = FileWrapperUtil.wrapFile(file)
        local isFileAcceptable = (self.booleanVisitorInterface:visit(abFile))
        return isFileAcceptable or file:isDirectory()
end


-- Java overloaded method: Lua keeps the last definition
function VisitorFileFilter:accept(file)
        local isFileAcceptable = (self.booleanVisitorInterface:visit(file))
        return isFileAcceptable or file:isDirectory()
end

return VisitorFileFilter

