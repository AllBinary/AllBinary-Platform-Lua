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

-- local Calendar = require("java.util.Calendar")
-- local HashMap = require("java.util.HashMap")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local EntryData = require("org.allbinary.business.entry.EntryData")
local Money = require("org.allbinary.business.user.commerce.money.Money")
local MoneyException = require("org.allbinary.business.user.commerce.money.MoneyException")
local ProductIdGenerator = require("org.allbinary.data.generator.ProductIdGenerator")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local CommonPhoneStrings = require("org.allbinary.string.CommonPhoneStrings")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local ItemInterface = require("org.allbinary.business.user.commerce.inventory.item.ItemInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicItem = {}
BasicItem.__index = BasicItem
BasicItem.className = "BasicItem"

function BasicItem:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.basicItemData = BasicItemData.getInstance()
    self.itemId = nil
    self.number = nil
    self.inBaskets = nil
    self.weight = nil
    self.enabled = nil
    self.newOrUsed = nil
    self.summary = nil
    self.distributor = nil
    self.idUsedByDistributor = nil
    self.producedBy = nil
    self.productionDate = nil
    self.startProductionDate = nil
    self.description = nil
    self.keywords = nil
    self.category = nil
    self.type = nil
    self.smallImage = nil
    self.mediumImage = nil
    self.largeImage = nil
    self.price = nil
    self.comment = nil
    self.customs = nil
    self.downloads = nil
    self.groups = nil
    self.options = nil
    self.permissions = nil
    self.specials = nil
    self.downloadable = false
    self.timeEntered = nil
    self.lastModified = nil
end

function BasicItem.new(...)
    local count = select("#", ...)
    if count == 1 then return BasicItem._new1(...)
    elseif count == 0 then return BasicItem._new0(...)
    end
end


function BasicItem._new1(itemHashMap)
    local self = setmetatable({}, BasicItem)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRODUCTSEARCHLOGGING) then
            self.logUtil:putF(self.commonStrings.START, self, "Constructor(HashMap)")
        end
        self.itemId = itemHashMap:get(self.basicItemData.ID)
        self.number = itemHashMap:get(self.basicItemData.NUMBER)
        self.inBaskets = itemHashMap:get(self.basicItemData.INBASKETS)
        self.weight = itemHashMap:get(self.basicItemData.WEIGHT)
        self.enabled = itemHashMap:get(EntryData.getInstance().ENABLE)
        self.newOrUsed = itemHashMap:get(self.basicItemData.NEWORUSED)
        self.summary = itemHashMap:get(self.basicItemData.SUMMARY)
        self.distributor = itemHashMap:get(self.basicItemData.DISTRIBUTOR)
        self.idUsedByDistributor = itemHashMap:get(self.basicItemData.IDUSEDBYDISTRIBUTOR)
        self.producedBy = itemHashMap:get(self.basicItemData.PRODUCEDBY)
        self.productionDate = itemHashMap:get(self.basicItemData.PRODUCTIONDATE)
        self.startProductionDate = itemHashMap:get(self.basicItemData.STARTPRODUCTIONDATE)
        self.description = itemHashMap:get(self.basicItemData.DESCRIPTION)
        self.keywords = itemHashMap:get(self.basicItemData.KEYWORDS)
        self.category = itemHashMap:get(self.basicItemData.CATEGORY)
        self.type = itemHashMap:get(self.basicItemData.TYPE)
        self.smallImage = itemHashMap:get(self.basicItemData.SMALLIMAGE)
        self.mediumImage = itemHashMap:get(self.basicItemData.MEDIUMIMAGE)
        self.largeImage = itemHashMap:get(self.basicItemData.LARGEIMAGE)
        self.timeEntered = itemHashMap:get(EntryData.getInstance().TIMECREATED)
        self.lastModified = itemHashMap:get(EntryData.getInstance().LASTMODIFIED)
        self.price = Money.new(itemHashMap:get(self.basicItemData.PRICE))
        self.comment = itemHashMap:get(self.basicItemData.COMMENT)
        self.customs = itemHashMap:get(self.basicItemData.CUSTOMS)
        self:setDownloads(itemHashMap:get(self.basicItemData.DOWNLOADS))
        self.groups = itemHashMap:get(self.basicItemData.GROUPS)
        self.options = itemHashMap:get(self.basicItemData.OPTIONS)
        self.permissions = itemHashMap:get(self.basicItemData.PERMISSIONS)
        self.specials = itemHashMap:get(self.basicItemData.SPECIALS)
    return self
end


function BasicItem._new0()
    local self = setmetatable({}, BasicItem)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRODUCTSEARCHLOGGING) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
        local EMPTY = StringUtil.getInstance().EMPTY_STRING
        self.itemId = ProductIdGenerator.new():getNext()
        self.number = CommonPhoneStrings.getInstance().ZERO
        self.inBaskets = EMPTY
        self.weight = EMPTY
        self.enabled = EMPTY
        self.newOrUsed = EMPTY
        self.summary = EMPTY
        self.distributor = EMPTY
        self.idUsedByDistributor = EMPTY
        self.producedBy = EMPTY
        self.productionDate = EMPTY
        self.startProductionDate = EMPTY
        self.description = EMPTY
        self.keywords = EMPTY
        self.category = EMPTY
        self.type = EMPTY
        self.smallImage = EMPTY
        self.mediumImage = EMPTY
        self.largeImage = EMPTY
        self.timeEntered = EMPTY
        self.lastModified = EMPTY
        self.price = Money.new()
        self.comment = EMPTY
        self.customs = EMPTY
        self:setDownloads(EMPTY)
        self.groups = EMPTY
        self.options = EMPTY
        self.permissions = EMPTY
        self.specials = EMPTY
    return self
end


function BasicItem:setId(itemId)
        self.itemId = itemId
end


function BasicItem:setNumber(number)
        self.number = number
end


function BasicItem:setInBaskets(value)
        self.inBaskets = value
end


function BasicItem:setWeight(value)
        self.weight = value
end


function BasicItem:setNewOrUsed(value)
        self.newOrUsed = value
end


function BasicItem:setSummary(value)
        self.summary = value
end


function BasicItem:setDistributor(value)
        self.distributor = value
end


function BasicItem:setIdUsedByDistributor(value)
        self.idUsedByDistributor = value
end


function BasicItem:setProducedBy(value)
        self.producedBy = value
end


function BasicItem:setProductionDate(value)
        self.productionDate = value
end


function BasicItem:setStartProductionDate(value)
        self.startProductionDate = value
end


function BasicItem:setDescription(value)
        self.description = value
end


function BasicItem:setKeywords(value)
        self.keywords = value
end


function BasicItem:setCategory(value)
        self.category = value
end


function BasicItem:setType(value)
        self.type = value
end


function BasicItem:setSmallImage(value)
        self.smallImage = value
end


function BasicItem:setMediumImage(value)
        self.mediumImage = value
end


function BasicItem:setLargeImage(value)
        self.largeImage = value
end


function BasicItem:setTimeEntered(value)
        self.timeEntered = value
end


function BasicItem:setLastModified(value)
        self.lastModified = value
end


function BasicItem:setPrice(value)
        self.price = value
end


function BasicItem:setComment(value)
        self.comment = value
end


function BasicItem:setCustoms(value)
        self.customs = value
end


function BasicItem:setDownloads(value)
        self.downloads = value
        if not StringValidationUtil.getInstance():isEmpty(self.downloads) then
            local downloadInteger = tostring(self.downloads)
            if math.tointeger(downloadInteger // 1) ~= 0 then
                self:setDownloadable(true)
            end
        end
end


function BasicItem:setGroups(value)
        self.groups = value
end


function BasicItem:setOptions(value)
        self.options = value
end


function BasicItem:setPermissions(value)
        self.permissions = value
end


function BasicItem:setSpecials(value)
        self.specials = value
end


function BasicItem:setEnabled(value)
        self.enabled = value
end


function BasicItem:getId()
        return self.itemId
end


function BasicItem:getNumber()
        return self.number
end


function BasicItem:getInBaskets()
        return self.inBaskets
end


function BasicItem:getWeight()
        return self.weight
end


function BasicItem:getNewOrUsed()
        return self.newOrUsed
end


function BasicItem:getSummary()
        return self.summary
end


function BasicItem:getDistributor()
        return self.distributor
end


function BasicItem:getIdUsedByDistributor()
        return self.idUsedByDistributor
end


function BasicItem:getProducedBy()
        return self.producedBy
end


function BasicItem:getProductionDate()
        return self.productionDate
end


function BasicItem:getStartProductionDate()
        return self.startProductionDate
end


function BasicItem:getDescription()
        return self.description
end


function BasicItem:getKeywords()
        return self.keywords
end


function BasicItem:getCategory()
        return self.category
end


function BasicItem:getType()
        return self.type
end


function BasicItem:getSmallImage()
        return self.smallImage
end


function BasicItem:getMediumImage()
        return self.mediumImage
end


function BasicItem:getLargeImage()
        return self.largeImage
end


function BasicItem:getTimeEntered()
        return self.timeEntered
end


function BasicItem:getLastModified()
        return self.lastModified
end


function BasicItem:getPrice()
        return self.price
end


function BasicItem:getComment()
        return self.comment
end


function BasicItem:getCustoms()
        return self.customs
end


function BasicItem:getDownloads()
        return self.downloads
end


function BasicItem:getGroups()
        return self.groups
end


function BasicItem:getOptions()
        return self.options
end


function BasicItem:getPermissions()
        return self.permissions
end


function BasicItem:getSpecials()
        return self.specials
end


function BasicItem:setDownloadable(downloadable)
        self.downloadable = downloadable
end


function BasicItem:isDownloadable()
        return self.downloadable
end


function BasicItem:getEnabled()
        return self.enabled
end


function BasicItem:getTotal()
        local itemTotal = Money.new(self.price)
        itemTotal:multiply(math.tointeger(self.number // 1))
        return itemTotal
end


function BasicItem:toHashMap()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRODUCTSEARCHLOGGING) then
            self.logUtil:putF(self.commonStrings.START, self, "toHashMap")
        end
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(self.basicItemData.ID, self.itemId)
        hashMap:put(self.basicItemData.NUMBER, self.number)
        hashMap:put(self.basicItemData.INBASKETS, self.inBaskets)
        hashMap:put(self.basicItemData.WEIGHT, self.weight)
        hashMap:put(EntryData.getInstance().ENABLE, self.enabled)
        hashMap:put(self.basicItemData.NEWORUSED, self.newOrUsed)
        hashMap:put(self.basicItemData.SUMMARY, self.summary)
        hashMap:put(self.basicItemData.DISTRIBUTOR, self.distributor)
        hashMap:put(self.basicItemData.IDUSEDBYDISTRIBUTOR, self.idUsedByDistributor)
        hashMap:put(self.basicItemData.PRODUCEDBY, self.producedBy)
        hashMap:put(self.basicItemData.PRODUCTIONDATE, self.productionDate)
        hashMap:put(self.basicItemData.STARTPRODUCTIONDATE, self.startProductionDate)
        hashMap:put(self.basicItemData.DESCRIPTION, self.description)
        hashMap:put(self.basicItemData.KEYWORDS, self.keywords)
        hashMap:put(self.basicItemData.CATEGORY, self.category)
        hashMap:put(self.basicItemData.TYPE, self.type)
        hashMap:put(self.basicItemData.SMALLIMAGE, self.smallImage)
        hashMap:put(self.basicItemData.MEDIUMIMAGE, self.mediumImage)
        hashMap:put(self.basicItemData.LARGEIMAGE, self.largeImage)
        local calendar = Calendar.getInstance()
        local time = tostring(calendar:getTimeInMillis())
        hashMap:put(EntryData.getInstance().LASTMODIFIED, time)
        hashMap:put(self.basicItemData.PRICE, tostring(self.price))
        hashMap:put(self.basicItemData.COMMENT, self.comment)
        hashMap:put(self.basicItemData.CUSTOMS, self.customs)
        hashMap:put(self.basicItemData.DOWNLOADS, self:getDownloads())
        hashMap:put(self.basicItemData.GROUPS, self.groups)
        hashMap:put(self.basicItemData.OPTIONS, self.options)
        hashMap:put(self.basicItemData.PERMISSIONS, self.permissions)
        hashMap:put(self.basicItemData.SPECIALS, self.specials)
        return hashMap
end


function BasicItem:toVector()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().PRODUCTSEARCHLOGGING) then
            self.logUtil:putF(self.commonStrings.START, self, "toVector")
        end
        local values = BasicArrayListD.new()
        values:add(self.itemId)
        values:add(self.number)
        values:add(self.inBaskets)
        values:add(self.weight)
        values:add(self.enabled)
        values:add(self.newOrUsed)
        values:add(self.summary)
        values:add(self.distributor)
        values:add(self.idUsedByDistributor)
        values:add(self.producedBy)
        values:add(self.productionDate)
        values:add(self.startProductionDate)
        values:add(self.description)
        values:add(self.keywords)
        values:add(self.category)
        values:add(self.type)
        values:add(self:getSmallImage())
        values:add(self:getMediumImage())
        values:add(self:getLargeImage())
        local calendar = Calendar.getInstance()
        local time = tostring(calendar:getTimeInMillis())
        values:add(time)
        values:add(time)
        values:add(tostring(self.price))
        values:add(self.comment)
        values:add(self.customs)
        values:add(self:getDownloads())
        values:add(self.groups)
        values:add(self.options)
        values:add(self.permissions)
        values:add(self.specials)
        return values
end


-- throws Exception
function BasicItem:getKey()
        return self:getId()
end

return BasicItem

