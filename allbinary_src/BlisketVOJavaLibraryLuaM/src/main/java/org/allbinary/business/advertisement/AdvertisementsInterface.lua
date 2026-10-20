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
-- package org.allbinary.business.advertisement


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
local AdvertisementsInterface = {}
AdvertisementsInterface.__index = AdvertisementsInterface
AdvertisementsInterface.className = "AdvertisementsInterface"


function AdvertisementsInterface:add(advertisementInterface)
    error("abstract method add")
end


function AdvertisementsInterface:get(index)
    error("abstract method get")
end


function AdvertisementsInterface:getCurrentPageNum()
    error("abstract method getCurrentPageNum")
end


function AdvertisementsInterface:getErrorDescription()
    error("abstract method getErrorDescription")
end


function AdvertisementsInterface:getErrorNum()
    error("abstract method getErrorNum")
end


function AdvertisementsInterface:getNumberOfPosters()
    error("abstract method getNumberOfPosters")
end


function AdvertisementsInterface:getNumberOfProductsInPage()
    error("abstract method getNumberOfProductsInPage")
end


function AdvertisementsInterface:getStatusCode()
    error("abstract method getStatusCode")
end


function AdvertisementsInterface:getTotalNumberOfProducts()
    error("abstract method getTotalNumberOfProducts")
end


function AdvertisementsInterface:isSearchValid()
    error("abstract method isSearchValid")
end


function AdvertisementsInterface:setCurrentPageNum(currentPageNum)
    error("abstract method setCurrentPageNum")
end


function AdvertisementsInterface:setErrorDescription(errorDescription)
    error("abstract method setErrorDescription")
end


function AdvertisementsInterface:setErrorNum(errorNum)
    error("abstract method setErrorNum")
end


function AdvertisementsInterface:setNumberOfProductsInPage(numberOfProductsInPage)
    error("abstract method setNumberOfProductsInPage")
end


function AdvertisementsInterface:setStatusCode(statusCode)
    error("abstract method setStatusCode")
end


function AdvertisementsInterface:setTotalNumberOfProducts(totalNumberOfProducts)
    error("abstract method setTotalNumberOfProducts")
end


function AdvertisementsInterface:toString()
    error("abstract method toString")
end
AdvertisementsInterface.__tostring = function(self) return self:toString() end

return AdvertisementsInterface

