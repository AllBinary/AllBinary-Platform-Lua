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
-- package org.allbinary.logic.io.file.visitor

local AbFile = require("org.allbinary.logic.io.file.AbFile")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BooleanFileVisitor = require("org.allbinary.logic.io.file.visitor.BooleanFileVisitor")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ExcludeFileExtensionsBooleanFileVisitor = {}
ExcludeFileExtensionsBooleanFileVisitor.__index = ExcludeFileExtensionsBooleanFileVisitor
ExcludeFileExtensionsBooleanFileVisitor.className = "ExcludeFileExtensionsBooleanFileVisitor"
setmetatable(ExcludeFileExtensionsBooleanFileVisitor, {__index = BooleanFileVisitor})


function ExcludeFileExtensionsBooleanFileVisitor.new(filterStringBasicArrayList)
    local self = setmetatable(BooleanFileVisitor.new(filterStringBasicArrayList), ExcludeFileExtensionsBooleanFileVisitor)
        -- super(...) made self above
    return self
end


function ExcludeFileExtensionsBooleanFileVisitor:visit(file)
        if self:getFilterStringBasicArrayList():size() == 0 then
            return true
        end
        return BooleanFileVisitor.visit(self, file)
end


-- Java overloaded method: Lua keeps the last definition
function ExcludeFileExtensionsBooleanFileVisitor:visit(file, fileNameString)
        local fileNameAndExtension = file:getPath()
        if #fileNameAndExtension > #fileNameString then
            local startIndex = #fileNameAndExtension - #fileNameString
            local fileName = string.sub(fileNameAndExtension, (startIndex) + 1)
            if ((fileName < fileNameString and -1) or (fileName > fileNameString and 1) or 0) == 0 then
                return false
            end
        end
        return true
end

return ExcludeFileExtensionsBooleanFileVisitor

