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
-- package views.generic.inventory

local StringMaker = require("org.allbinary.logic.string.StringMaker")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InventorySearchLoopInfo = {}
InventorySearchLoopInfo.__index = InventorySearchLoopInfo
InventorySearchLoopInfo.className = "InventorySearchLoopInfo"

function InventorySearchLoopInfo:_init_fields()
    self.lastPage = -1
    self.currentPage = -1
    self.numberOfResultsOnCurrentPage = 0
    self.numberOfResults = 0
    self.CURRENT = "current: "
    self.NUM = " num: "
    self.LAST = " last: "
end

function InventorySearchLoopInfo.new()
    local self = setmetatable({}, InventorySearchLoopInfo)
    self:_init_fields()
    return self
end


function InventorySearchLoopInfo:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.CURRENT)
        stringBuffer:appendint(self.currentPage)
        stringBuffer:append(self.NUM)
        stringBuffer:appendint(self.numberOfResults)
        stringBuffer:append(self.LAST)
        stringBuffer:appendint(self.lastPage)
        return tostring(stringBuffer)
end
InventorySearchLoopInfo.__tostring = function(self) return self:toString() end

return InventorySearchLoopInfo

