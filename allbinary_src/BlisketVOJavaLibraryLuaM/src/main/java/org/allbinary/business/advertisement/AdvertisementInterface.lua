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

local AdvertisementImageInterface = require("org.allbinary.business.advertisement.image.AdvertisementImageInterface")
local AdvertisementProductInterface = require("org.allbinary.business.advertisement.product.AdvertisementProductInterface")
local AdvertisementThumbnailInterface = require("org.allbinary.business.advertisement.thumbnail.AdvertisementThumbnailInterface")
local Money = require("org.allbinary.business.user.commerce.money.Money")
local DisplayInBrowserContraintsInterface = require("org.allbinary.logic.control.contraints.display.browser.DisplayInBrowserContraintsInterface")

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
local AdvertisementInterface = {}
AdvertisementInterface.__index = AdvertisementInterface
AdvertisementInterface.className = "AdvertisementInterface"


function AdvertisementInterface:getArtist()
    error("abstract method getArtist")
end


function AdvertisementInterface:getArtistLink()
    error("abstract method getArtistLink")
end


function AdvertisementInterface:getTitle()
    error("abstract method getTitle")
end


function AdvertisementInterface:getDateAdded()
    error("abstract method getDateAdded")
end


function AdvertisementInterface:getDirectory()
    error("abstract method getDirectory")
end


function AdvertisementInterface:getFramedLink()
    error("abstract method getFramedLink")
end


function AdvertisementInterface:getListPrice()
    error("abstract method getListPrice")
end


function AdvertisementInterface:getOurPrice()
    error("abstract method getOurPrice")
end


function AdvertisementInterface:getRank()
    error("abstract method getRank")
end


function AdvertisementInterface:getImage()
    error("abstract method getImage")
end


function AdvertisementInterface:getProduct()
    error("abstract method getProduct")
end


function AdvertisementInterface:getThumbnail()
    error("abstract method getThumbnail")
end


function AdvertisementInterface:getDisplayInBrowserContraintsInterface()
    error("abstract method getDisplayInBrowserContraintsInterface")
end


function AdvertisementInterface:setArtist(artist)
    error("abstract method setArtist")
end


function AdvertisementInterface:setArtistLink(artistLink)
    error("abstract method setArtistLink")
end


function AdvertisementInterface:setTitle(title)
    error("abstract method setTitle")
end


function AdvertisementInterface:setDateAdded(dateAdded)
    error("abstract method setDateAdded")
end


function AdvertisementInterface:setDirectory(directory)
    error("abstract method setDirectory")
end


function AdvertisementInterface:setFramedLink(framedLink)
    error("abstract method setFramedLink")
end


function AdvertisementInterface:setRank(rank)
    error("abstract method setRank")
end


function AdvertisementInterface:setImage(AdvertisementImageInterface)
    error("abstract method setImage")
end


function AdvertisementInterface:setProduct(AdvertisementProductInterface)
    error("abstract method setProduct")
end


function AdvertisementInterface:setThumbnail(AdvertisementThumbnailInterface)
    error("abstract method setThumbnail")
end

return AdvertisementInterface

