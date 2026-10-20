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
-- package org.allbinary.business.user.commerce.inventory.item.option


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicOptionItemData = {}
BasicOptionItemData.__index = BasicOptionItemData
BasicOptionItemData.className = "BasicOptionItemData"

function BasicOptionItemData.new()
    local self = setmetatable({}, BasicOptionItemData)
    return self
end

BasicOptionItemData.OPTION_ONE_TITLE = "BASICOPTIONITEM_OPTION_ONE_TITLE"
BasicOptionItemData.DEFAULT_OPTION_ITEM = "BASICOPTIONITEM_DEFAULT_OPTION_ITEM"
BasicOptionItemData.DEFAULT_OPTION_VALUE = "BASICOPTIONITEM_DEFAULT_OPTION_VALUE"
BasicOptionItemData.OPTION_ONE_ONE_ITEM = "BASICOPTIONITEM_OPTION_ONE_ONE_ITEM"
BasicOptionItemData.OPTION_ONE_ONE_VALUE = "BASICOPTIONITEM_OPTION_ONE_ONE_VALUE"
BasicOptionItemData.OPTION_ONE_TWO_ITEM = "BASICOPTIONITEM_OPTION_ONE_TWO_ITEM"
BasicOptionItemData.OPTION_ONE_TWO_VALUE = "BASICOPTIONITEM_OPTION_ONE_TWO_VALUE"
BasicOptionItemData.OPTION_ONE_THREE_ITEM = "BASICOPTIONITEM_OPTION_ONE_THREE_ITEM"
BasicOptionItemData.OPTION_ONE_THREE_VALUE = "BASICOPTIONITEM_OPTION_ONE_THREE_VALUE"
BasicOptionItemData.OPTION_ONE_FOUR_ITEM = "BASICOPTIONITEM_OPTION_ONE_FOUR_ITEM"
BasicOptionItemData.OPTION_ONE_FOUR_VALUE = "BASICOPTIONITEM_OPTION_ONE_FOUR_VALUE"
BasicOptionItemData.OPTION_ONE_FIVE_ITEM = "BASICOPTIONITEM_OPTION_ONE_FIVE_ITEM"
BasicOptionItemData.OPTION_ONE_FIVE_VALUE = "BASICOPTIONITEM_OPTION_ONE_FIVE_VALUE"
BasicOptionItemData.OPTION_ONE_SIX_ITEM = "BASICOPTIONITEM_OPTION_ONE_SIX_ITEM"
BasicOptionItemData.OPTION_ONE_SIX_VALUE = "BASICOPTIONITEM_OPTION_ONE_SIX_VALUE"
BasicOptionItemData.OPTION_ONE_SEVEN_ITEM = "BASICOPTIONITEM_OPTION_ONE_SEVEN_ITEM"
BasicOptionItemData.OPTION_ONE_SEVEN_VALUE = "BASICOPTIONITEM_OPTION_ONE_SEVEN_VALUE"
BasicOptionItemData.OPTION_ONE_EIGHT_ITEM = "BASICOPTIONITEM_OPTION_ONE_EIGHT_ITEM"
BasicOptionItemData.OPTION_ONE_EIGHT_VALUE = "BASICOPTIONITEM_OPTION_ONE_EIGHT_VALUE"
BasicOptionItemData.OPTION_ONE_NINE_ITEM = "BASICOPTIONITEM_OPTION_ONE_NINE_ITEM"
BasicOptionItemData.OPTION_ONE_NINE_VALUE = "BASICOPTIONITEM_OPTION_ONE_NINE_VALUE"

return BasicOptionItemData

