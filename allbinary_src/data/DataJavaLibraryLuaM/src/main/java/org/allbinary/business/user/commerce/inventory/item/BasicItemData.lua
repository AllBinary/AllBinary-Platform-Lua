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
-- package org.allbinary.business.user.commerce.inventory.item


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicItemData = {}
BasicItemData.__index = BasicItemData
BasicItemData.className = "BasicItemData"

function BasicItemData:_init_fields()
    self.ITEM = "BASICITEM"
    self.TOTAL = "BASICITEM_TOTAL"
    self.ID = "BASICITEM_ID"
    self.NUMBER = "BASICITEM_NUMBER"
    self.INBASKETS = "BASICITEM_IN_BASKETS"
    self.WEIGHT = "BASICITEM_WEIGHT"
    self.NEWORUSED = "BASICITEM_NEW_OR_USED"
    self.SUMMARY = "BASICITEM_SUMMARY"
    self.DISTRIBUTOR = "BASICITEM_DISTRIBUTOR"
    self.IDUSEDBYDISTRIBUTOR = "BASICITEM_IDUSEDBYDISTRIBUTOR"
    self.PRODUCEDBY = "BASICITEM_PRODUCEDBY"
    self.PRODUCTIONDATE = "BASICITEM_PRODUCTIONDATE"
    self.STARTPRODUCTIONDATE = "BASICITEM_STARTPRODUCTIONDATE"
    self.DESCRIPTION = "BASICITEM_DESCRIPTION"
    self.KEYWORDS = "BASICITEM_KEYWORDS"
    self.CATEGORY = "BASICITEM_CATEGORY"
    self.TYPE = "BASICITEM_TYPE"
    self.IMAGE = "BASICITEM_IMG"
    self.SMALLIMAGE = "BASICITEM_SMALL_IMG"
    self.MEDIUMIMAGE = "BASICITEM_MEDIUM_IMG"
    self.LARGEIMAGE = "BASICITEM_LARGE_IMG"
    self.PRICE = "BASICITEM_PRICE"
    self.COMMENT = "BASICITEM_COMMENT"
    self.CUSTOMS = "BASICITEM_CUSTOMS"
    self.DOWNLOADS = "BASICITEM_DOWNLOADS"
    self.GROUPS = "BASICITEM_GROUPS"
    self.OPTIONS = "BASICITEM_OPTIONS"
    self.PERMISSIONS = "BASICITEM_PERMISSIONS"
    self.SPECIALS = "BASICITEM_SPECIALS"
end

function BasicItemData.new()
    local self = setmetatable({}, BasicItemData)
    self:_init_fields()
    return self
end


function BasicItemData.getInstance()
        return BasicItemData.instance
end

BasicItemData.instance = BasicItemData.new()

return BasicItemData

