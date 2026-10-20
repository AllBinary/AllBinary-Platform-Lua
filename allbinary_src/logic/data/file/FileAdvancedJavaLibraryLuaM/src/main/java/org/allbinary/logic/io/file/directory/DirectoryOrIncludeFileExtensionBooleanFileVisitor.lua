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
-- package org.allbinary.logic.io.file.directory

local AbFile = require("org.allbinary.logic.io.file.AbFile")
local IncludeFileExtensionsBooleanFileVisitor = require("org.allbinary.logic.io.file.visitor.IncludeFileExtensionsBooleanFileVisitor")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local DirectoryOrIncludeFileExtensionBooleanFileVisitor = {}
DirectoryOrIncludeFileExtensionBooleanFileVisitor.__index = DirectoryOrIncludeFileExtensionBooleanFileVisitor
DirectoryOrIncludeFileExtensionBooleanFileVisitor.className = "DirectoryOrIncludeFileExtensionBooleanFileVisitor"
setmetatable(DirectoryOrIncludeFileExtensionBooleanFileVisitor, {__index = IncludeFileExtensionsBooleanFileVisitor})

function DirectoryOrIncludeFileExtensionBooleanFileVisitor:_init_fields()
    self.includesString = nil
end

function DirectoryOrIncludeFileExtensionBooleanFileVisitor.new(...)
    local count = select("#", ...)
    if count == 1 then return DirectoryOrIncludeFileExtensionBooleanFileVisitor._new1(...)
    elseif count == 2 then return DirectoryOrIncludeFileExtensionBooleanFileVisitor._new2(...)
    end
end


function DirectoryOrIncludeFileExtensionBooleanFileVisitor._new1(filterStringBasicArrayList)
    local self = setmetatable(IncludeFileExtensionsBooleanFileVisitor.new(filterStringBasicArrayList), DirectoryOrIncludeFileExtensionBooleanFileVisitor)
    self:_init_fields()
        -- super(...) made self above
        self.includesString = nil
    return self
end


function DirectoryOrIncludeFileExtensionBooleanFileVisitor._new2(filterStringBasicArrayList, includesString)
    local self = setmetatable(IncludeFileExtensionsBooleanFileVisitor.new(filterStringBasicArrayList), DirectoryOrIncludeFileExtensionBooleanFileVisitor)
    self:_init_fields()
        -- super(...) made self above
        self.includesString = includesString
    return self
end


function DirectoryOrIncludeFileExtensionBooleanFileVisitor:visit(file)
        if file:isDirectory() then
            return true
        end
        if self.includesString == nil or file:getAbsolutePath():indexOf(self.includesString) >= 0 then
            return IncludeFileExtensionsBooleanFileVisitor.visit(self, file)
        else
            return false
        end
end

return DirectoryOrIncludeFileExtensionBooleanFileVisitor

