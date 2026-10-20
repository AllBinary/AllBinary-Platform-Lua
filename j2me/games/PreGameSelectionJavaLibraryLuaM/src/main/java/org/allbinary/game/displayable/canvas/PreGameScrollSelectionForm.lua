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

local ABCustomItem = require("org.allbinary.graphics.form.item.ABCustomItem")
local Rectangle = require("org.allbinary.graphics.Rectangle")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local FormTypeFactory = require("org.allbinary.graphics.form.FormTypeFactory")
local ItemPaintableFactory = require("org.allbinary.graphics.form.ItemPaintableFactory")
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

local PreGameScrollSelectionForm = {}
PreGameScrollSelectionForm.__index = PreGameScrollSelectionForm
PreGameScrollSelectionForm.className = "PreGameScrollSelectionForm"
setmetatable(PreGameScrollSelectionForm, {__index = ScrollCurrentSelectionForm})


function PreGameScrollSelectionForm.new(title, items, formPaintableFactory, backgroundBasicColor, foregroundBasicColor)
    local self = setmetatable(ScrollCurrentSelectionForm.new(title, items, formPaintableFactory, 0, 3, false, backgroundBasicColor, foregroundBasicColor), PreGameScrollSelectionForm)
        -- super(...) made self above
    return self
end


-- throws Exception
function PreGameScrollSelectionForm:init(rectangle)
        ScrollCurrentSelectionForm.init(self, rectangle, FormTypeFactory.getInstance().TEMP_HORIZONTAL_FORM)
end

return PreGameScrollSelectionForm

