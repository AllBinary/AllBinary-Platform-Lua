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

local Advertisement = {}
package.loaded["org.allbinary.business.advertisement.Advertisement"] = Advertisement

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local AdvertisementImageInterface = java_lazy("org.allbinary.business.advertisement.image.AdvertisementImageInterface")
local AdvertisementProductInterface = java_lazy("org.allbinary.business.advertisement.product.AdvertisementProductInterface")
local AdvertisementThumbnailInterface = java_lazy("org.allbinary.business.advertisement.thumbnail.AdvertisementThumbnailInterface")
local Money = java_lazy("org.allbinary.business.user.commerce.money.Money")
local DisplayInBrowserContraintsInterface = java_lazy("org.allbinary.logic.control.contraints.display.browser.DisplayInBrowserContraintsInterface")
local AdvertisementInterface = require("org.allbinary.business.advertisement.AdvertisementInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table Advertisement is declared before the requires
Advertisement.__index = Advertisement
Advertisement.className = "Advertisement"
Advertisement.javaClassName = "org.allbinary.business.advertisement.Advertisement"
Advertisement.java_implements = " AdvertisementInterface "
Advertisement.java_interfaces = function() return {AdvertisementInterface} end

function Advertisement:_init_fields()
    if self.artist == nil then self.artist = nil end
    if self.artistLink == nil then self.artistLink = nil end
    if self.title == nil then self.title = nil end
    if self.dateAdded == nil then self.dateAdded = nil end
    if self.directory == nil then self.directory = nil end
    if self.framedLink == nil then self.framedLink = nil end
    if self.rank == nil then self.rank = 0 end
    if self.listPrice == nil then self.listPrice = nil end
    if self.ourPrice == nil then self.ourPrice = nil end
    if self.image == nil then self.image = nil end
    if self.product == nil then self.product = nil end
    if self.thumbnail == nil then self.thumbnail = nil end
    if self.displayInBrowserContraintsInterface == nil then self.displayInBrowserContraintsInterface = nil end
end


function Advertisement._jinit(self)
    Advertisement._init_fields(self)
        self.displayInBrowserContraintsInterface = nil
    return self
end

function Advertisement.new(...)
    local self = setmetatable({}, Advertisement)
    Advertisement._jinit(self, ...)
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

