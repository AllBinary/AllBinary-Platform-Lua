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

local Money = require("org.allbinary.business.user.commerce.money.Money")
local TableMappingInterface = require("org.allbinary.data.tables.TableMappingInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- Java interface
local ItemInterface = {}
ItemInterface.__index = ItemInterface
ItemInterface.className = "ItemInterface"
setmetatable(ItemInterface, {__index = TableMappingInterface})


function ItemInterface:setId(itemId)
    error("abstract method setId")
end


function ItemInterface:setNumber(number)
    error("abstract method setNumber")
end


function ItemInterface:setInBaskets(value)
    error("abstract method setInBaskets")
end


function ItemInterface:setWeight(value)
    error("abstract method setWeight")
end


function ItemInterface:setEnabled(value)
    error("abstract method setEnabled")
end


function ItemInterface:setNewOrUsed(value)
    error("abstract method setNewOrUsed")
end


function ItemInterface:setSummary(value)
    error("abstract method setSummary")
end


function ItemInterface:setDistributor(value)
    error("abstract method setDistributor")
end


function ItemInterface:setIdUsedByDistributor(value)
    error("abstract method setIdUsedByDistributor")
end


function ItemInterface:setProducedBy(value)
    error("abstract method setProducedBy")
end


function ItemInterface:setProductionDate(value)
    error("abstract method setProductionDate")
end


function ItemInterface:setStartProductionDate(value)
    error("abstract method setStartProductionDate")
end


function ItemInterface:setDescription(value)
    error("abstract method setDescription")
end


function ItemInterface:setKeywords(value)
    error("abstract method setKeywords")
end


function ItemInterface:setCategory(value)
    error("abstract method setCategory")
end


function ItemInterface:setType(value)
    error("abstract method setType")
end


function ItemInterface:setSmallImage(value)
    error("abstract method setSmallImage")
end


function ItemInterface:setMediumImage(value)
    error("abstract method setMediumImage")
end


function ItemInterface:setLargeImage(value)
    error("abstract method setLargeImage")
end


function ItemInterface:setTimeEntered(value)
    error("abstract method setTimeEntered")
end


function ItemInterface:setLastModified(value)
    error("abstract method setLastModified")
end


function ItemInterface:setPrice(value)
    error("abstract method setPrice")
end


function ItemInterface:setComment(value)
    error("abstract method setComment")
end


function ItemInterface:setCustoms(value)
    error("abstract method setCustoms")
end


function ItemInterface:setDownloads(value)
    error("abstract method setDownloads")
end


function ItemInterface:setGroups(value)
    error("abstract method setGroups")
end


function ItemInterface:setOptions(value)
    error("abstract method setOptions")
end


function ItemInterface:setPermissions(value)
    error("abstract method setPermissions")
end


function ItemInterface:setSpecials(value)
    error("abstract method setSpecials")
end


function ItemInterface:getId()
    error("abstract method getId")
end


function ItemInterface:getNumber()
    error("abstract method getNumber")
end


function ItemInterface:getInBaskets()
    error("abstract method getInBaskets")
end


function ItemInterface:getWeight()
    error("abstract method getWeight")
end


function ItemInterface:getEnabled()
    error("abstract method getEnabled")
end


function ItemInterface:getNewOrUsed()
    error("abstract method getNewOrUsed")
end


function ItemInterface:getSummary()
    error("abstract method getSummary")
end


function ItemInterface:getDistributor()
    error("abstract method getDistributor")
end


function ItemInterface:getIdUsedByDistributor()
    error("abstract method getIdUsedByDistributor")
end


function ItemInterface:getProducedBy()
    error("abstract method getProducedBy")
end


function ItemInterface:getProductionDate()
    error("abstract method getProductionDate")
end


function ItemInterface:getStartProductionDate()
    error("abstract method getStartProductionDate")
end


function ItemInterface:getDescription()
    error("abstract method getDescription")
end


function ItemInterface:getKeywords()
    error("abstract method getKeywords")
end


function ItemInterface:getCategory()
    error("abstract method getCategory")
end


function ItemInterface:getType()
    error("abstract method getType")
end


function ItemInterface:getSmallImage()
    error("abstract method getSmallImage")
end


function ItemInterface:getMediumImage()
    error("abstract method getMediumImage")
end


function ItemInterface:getLargeImage()
    error("abstract method getLargeImage")
end


function ItemInterface:getTimeEntered()
    error("abstract method getTimeEntered")
end


function ItemInterface:getLastModified()
    error("abstract method getLastModified")
end


function ItemInterface:getPrice()
    error("abstract method getPrice")
end


function ItemInterface:getComment()
    error("abstract method getComment")
end


function ItemInterface:getCustoms()
    error("abstract method getCustoms")
end


function ItemInterface:getDownloads()
    error("abstract method getDownloads")
end


function ItemInterface:getGroups()
    error("abstract method getGroups")
end


function ItemInterface:getOptions()
    error("abstract method getOptions")
end


function ItemInterface:getPermissions()
    error("abstract method getPermissions")
end


function ItemInterface:getSpecials()
    error("abstract method getSpecials")
end


function ItemInterface:getTotal()
    error("abstract method getTotal")
end

return ItemInterface

