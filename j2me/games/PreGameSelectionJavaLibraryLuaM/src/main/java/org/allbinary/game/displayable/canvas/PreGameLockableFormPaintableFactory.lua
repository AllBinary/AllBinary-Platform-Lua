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
-- package org.allbinary.game.displayable.canvas

local ItemPaintable = require("org.allbinary.graphics.form.ItemPaintable")
local ItemPaintableFactory = require("org.allbinary.graphics.form.ItemPaintableFactory")
local PaintableForm = require("org.allbinary.graphics.form.PaintableForm")
local ScrollCurrentSelectionForm = require("org.allbinary.graphics.form.ScrollCurrentSelectionForm")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PreGameLockableFormPaintableFactory = {}
PreGameLockableFormPaintableFactory.__index = PreGameLockableFormPaintableFactory
PreGameLockableFormPaintableFactory.className = "PreGameLockableFormPaintableFactory"
setmetatable(PreGameLockableFormPaintableFactory, {__index = ItemPaintableFactory})

function PreGameLockableFormPaintableFactory:_init_fields()
    self.lockedIndex = nil
end


function PreGameLockableFormPaintableFactory.new(lockedIndex)
    local self = setmetatable(ItemPaintableFactory.new(), PreGameLockableFormPaintableFactory)
    self:_init_fields()
        self.lockedIndex = lockedIndex
    return self
end


-- throws Exception
function PreGameLockableFormPaintableFactory:getInstanceItemPaintable(paintableForm)
        return PreGameLockablePaintable.new(paintableForm, self.lockedIndex)
end

return PreGameLockableFormPaintableFactory

