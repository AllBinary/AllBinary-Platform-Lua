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
-- package org.allbinary.data.generator

local PATH_GLOBALS = require("org.allbinary.globals.PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local UniqueIdGenerator = require("org.allbinary.data.generator.UniqueIdGenerator")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OrderItemIdGenerator = {}
OrderItemIdGenerator.__index = OrderItemIdGenerator
OrderItemIdGenerator.className = "OrderItemIdGenerator"
setmetatable(OrderItemIdGenerator, {__index = UniqueIdGenerator})

function OrderItemIdGenerator:_init_fields()
    self.IDFILE = "orderitemId.unq"
end


function OrderItemIdGenerator.new()
    local self = setmetatable(UniqueIdGenerator.new(), OrderItemIdGenerator)
    self:_init_fields()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.URLGLOBALS:getMainPath())
        stringBuffer:append(self.PATH_GLOBALS:getInstance().INIT_PATH)
        stringBuffer:append(self.IDFILE)
        stringBuffer:append(UniqueIdGenerator.EXT)
        UniqueIdGenerator.setFile(self, tostring(stringBuffer), self.IDFILE)
    return self
end

return OrderItemIdGenerator

