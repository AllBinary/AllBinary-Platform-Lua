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
-- package org.allbinary.business.advertisement.search

local AdvertisementSearchInterface = {}
package.loaded["org.allbinary.business.advertisement.search.AdvertisementSearchInterface"] = AdvertisementSearchInterface

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

local HashMap = java_lazy("java.util.HashMap")
local AdvertisementCategoryInterface = java_lazy("org.allbinary.business.advertisement.search.category.AdvertisementCategoryInterface")
local AdvertisementWebsiteInterface = java_lazy("org.allbinary.business.advertisement.search.website.AdvertisementWebsiteInterface")
local PriceConstraintInterface = java_lazy("org.allbinary.logic.control.contraints.price.PriceConstraintInterface")
local TwoDimensionalConstraintInterface = java_lazy("org.allbinary.logic.control.contraints.size.TwoDimensionalConstraintInterface")

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

-- Java interface
-- class table AdvertisementSearchInterface is declared before the requires
AdvertisementSearchInterface.__index = AdvertisementSearchInterface
AdvertisementSearchInterface.className = "AdvertisementSearchInterface"
AdvertisementSearchInterface.javaClassName = "org.allbinary.business.advertisement.search.AdvertisementSearchInterface"


function AdvertisementSearchInterface:getWebSite()
    error("abstract method getWebSite")
end


function AdvertisementSearchInterface:getCategory()
    error("abstract method getCategory")
end


function AdvertisementSearchInterface:getSizeConstraints()
    error("abstract method getSizeConstraints")
end


function AdvertisementSearchInterface:getPricingConstraints()
    error("abstract method getPricingConstraints")
end


function AdvertisementSearchInterface:getPageNumber()
    error("abstract method getPageNumber")
end


function AdvertisementSearchInterface:getProductsPerPage()
    error("abstract method getProductsPerPage")
end


function AdvertisementSearchInterface:getSearchParams()
    error("abstract method getSearchParams")
end


function AdvertisementSearchInterface:setCategory(advertisementCategoryInterface)
    error("abstract method setCategory")
end


function AdvertisementSearchInterface:setSizeConstraints(twoDimensionConstraintsInterface)
    error("abstract method setSizeConstraints")
end


function AdvertisementSearchInterface:setPricingConstraints(priceConstraintInterface)
    error("abstract method setPricingConstraints")
end


function AdvertisementSearchInterface:setPageNumber(pageNumber)
    error("abstract method setPageNumber")
end


function AdvertisementSearchInterface:setProductsPerPage(productsPerPage)
    error("abstract method setProductsPerPage")
end


function AdvertisementSearchInterface:setSearchParams(columnAndKeywordHashMap)
    error("abstract method setSearchParams")
end

return AdvertisementSearchInterface

