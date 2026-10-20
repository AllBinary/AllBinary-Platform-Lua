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
-- package org.allbinary.graphics.form

local ItemPaintableFactory = require("org.allbinary.graphics.form.ItemPaintableFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LockableFormPaintableFactory = {}
LockableFormPaintableFactory.__index = LockableFormPaintableFactory
LockableFormPaintableFactory.className = "LockableFormPaintableFactory"
setmetatable(LockableFormPaintableFactory, {__index = ItemPaintableFactory})

function LockableFormPaintableFactory:_init_fields()
    self.lockedIndex = nil
end


function LockableFormPaintableFactory.new(lockedIndex)
    local self = setmetatable(ItemPaintableFactory.new(), LockableFormPaintableFactory)
    self:_init_fields()
        self.lockedIndex = lockedIndex
    return self
end


-- throws Exception
function LockableFormPaintableFactory:getInstanceItemPaintable(paintableForm)
        return LockablePaintable.new(self.lockedIndex)
end

return LockableFormPaintableFactory

