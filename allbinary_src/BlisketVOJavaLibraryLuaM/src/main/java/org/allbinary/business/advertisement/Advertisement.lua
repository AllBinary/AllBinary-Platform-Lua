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
local AdvertisementInterface = require("org.allbinary.business.advertisement.AdvertisementInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Advertisement = {}
Advertisement.__index = Advertisement
Advertisement.className = "Advertisement"

function Advertisement:_init_fields()
    self.artist = nil
    self.artistLink = nil
    self.title = nil
    self.dateAdded = nil
    self.directory = nil
    self.framedLink = nil
    self.rank = 0
    self.listPrice = nil
    self.ourPrice = nil
    self.image = nil
    self.product = nil
    self.thumbnail = nil
    self.displayInBrowserContraintsInterface = nil
end


function Advertisement.new()
    local self = setmetatable({}, Advertisement)
    self:_init_fields()
        self.displayInBrowserContraintsInterface = nil
    return self
end


function Advertisement:getArtist()
        return self.artist
end


function Advertisement:setArtist(artist)
        self.artist = artist
end


function Advertisement:getArtistLink()
        return self.artistLink
end


function Advertisement:setArtistLink(artistLink)
        self.artistLink = artistLink
end


function Advertisement:getTitle()
        return self.title
end


function Advertisement:setTitle(title)
        self.title = title
end


function Advertisement:getDateAdded()
        return self.dateAdded
end


function Advertisement:setDateAdded(dateAdded)
        self.dateAdded = dateAdded
end


function Advertisement:getDirectory()
        return self.directory
end


function Advertisement:setDirectory(directory)
        self.directory = directory
end


function Advertisement:getFramedLink()
        return self.framedLink
end


function Advertisement:setFramedLink(framedLink)
        self.framedLink = framedLink
end


function Advertisement:getListPrice()
        return self.listPrice
end


function Advertisement:setListPrice(listPrice)
        self.listPrice = listPrice
end


function Advertisement:getOurPrice()
        return self.ourPrice
end


function Advertisement:setOurPrice(ourPrice)
        self.ourPrice = ourPrice
end


function Advertisement:getRank()
        return self.rank
end


function Advertisement:setRank(rank)
        self.rank = rank
end


function Advertisement:getImage()
        return self.image
end


function Advertisement:setImage(image)
        self.image = image
end


function Advertisement:getProduct()
        return self.product
end


function Advertisement:setProduct(product)
        self.product = product
end


function Advertisement:getThumbnail()
        return self.thumbnail
end


function Advertisement:setThumbnail(thumbnail)
        self.thumbnail = thumbnail
end


function Advertisement:getDisplayInBrowserContraintsInterface()
        return self.displayInBrowserContraintsInterface
end

return Advertisement

