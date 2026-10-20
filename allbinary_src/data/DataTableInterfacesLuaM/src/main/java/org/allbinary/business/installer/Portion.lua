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
-- package org.allbinary.business.installer

-- local HashMap = require("java.util.HashMap")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Portion = {}
Portion.__index = Portion
Portion.className = "Portion"

function Portion:_init_fields()
    self.current = nil
    self.total = nil
end


function Portion.new(hashMap)
    local self = setmetatable({}, Portion)
    self:_init_fields()
        self.current = hashMap:get("current")
        self.total = hashMap:get("total")
    return self
end


function Portion:getCurrent()
        return self.current
end


function Portion:getTotal()
        return self.total
end

return Portion

