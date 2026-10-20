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
-- package org.allbinary.business.page


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PageData = {}
PageData.__index = PageData
PageData.className = "PageData"

function PageData:_init_fields()
    self.NAME = "PAGE_NAME"
end


function PageData.getInstance()
        return PageData.instance
end


function PageData.new()
    local self = setmetatable({}, PageData)
    self:_init_fields()
    return self
end

PageData.instance = PageData.new()

return PageData

