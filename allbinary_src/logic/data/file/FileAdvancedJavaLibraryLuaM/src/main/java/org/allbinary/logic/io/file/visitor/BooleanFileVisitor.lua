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

local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local VisitorInterface = require("org.allbinary.logic.util.visitor.VisitorInterface")
local CommonStrings = require("org.allbinary.string.CommonStrings")
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

local BooleanFileVisitor = {}
BooleanFileVisitor.__index = BooleanFileVisitor
BooleanFileVisitor.className = "BooleanFileVisitor"

function BooleanFileVisitor:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.filterStringBasicArrayList = nil
end


function BooleanFileVisitor.new(filterStringBasicArrayList)
    local self = setmetatable({}, BooleanFileVisitor)
    self:_init_fields()
        self:setFilterStringBasicArrayList(filterStringBasicArrayList)
        PreLogUtil.put("Filter BasicArrayList: " .. tostring(self:getFilterStringBasicArrayList()), self, self.commonStrings.CONSTRUCTOR)
    return self
end


function BooleanFileVisitor:visit(anyType)
        return self:visit(anyType)
end


-- Java overloaded method: Lua keeps the last definition
function BooleanFileVisitor:visit(file)
        local list = self:getFilterStringBasicArrayList()
        local size = list:size()
        local nextFileFilterString = nil
        for index = 0, size - 1 do
            nextFileFilterString = list:get(index)
            if self:visit(file, nextFileFilterString) then
                return true
            end
        end
        return false
end


function BooleanFileVisitor:getFilterStringBasicArrayList()
        return self.filterStringBasicArrayList
end


function BooleanFileVisitor:setFilterStringBasicArrayList(filterStringBasicArrayList)
        self.filterStringBasicArrayList = filterStringBasicArrayList
end


-- Java overloaded method: Lua keeps the last definition
function BooleanFileVisitor:visit(file, fileNameString)
        return false
end

return BooleanFileVisitor

