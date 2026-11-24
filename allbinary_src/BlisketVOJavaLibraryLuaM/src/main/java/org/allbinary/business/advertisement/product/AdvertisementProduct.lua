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
-- package org.allbinary.business.advertisement.product

local AdvertisementProduct = {}
package.loaded["org.allbinary.business.advertisement.product.AdvertisementProduct"] = AdvertisementProduct

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

local TwoDimensionalConstraintInterface = java_lazy("org.allbinary.logic.control.contraints.size.TwoDimensionalConstraintInterface")
local AdvertisementProductInterface = require("org.allbinary.business.advertisement.product.AdvertisementProductInterface")

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

-- class table AdvertisementProduct is declared before the requires
AdvertisementProduct.__index = AdvertisementProduct
AdvertisementProduct.className = "AdvertisementProduct"
AdvertisementProduct.javaClassName = "org.allbinary.business.advertisement.product.AdvertisementProduct"
AdvertisementProduct.java_implements = " AdvertisementProductInterface "
AdvertisementProduct.java_interfaces = function() return {AdvertisementProductInterface} end

function AdvertisementProduct:_init_fields()
    if self.type == nil then self.type = nil end
    if self.link == nil then self.link = nil end
    if self.number == nil then self.number = 0 end
    if self.constraint == nil then self.constraint = nil end
end


function AdvertisementProduct._jinit(self)
    AdvertisementProduct._init_fields(self)
    return self
end

function AdvertisementProduct.new(...)
    local self = setmetatable({}, AdvertisementProduct)
    AdvertisementProduct._jinit(self, ...)
    return self
end


function AdvertisementProduct:getType()
        return self.type
end


function AdvertisementProduct:getLink()
        return self.link
end


function AdvertisementProduct:getNumber()
        return self.number
end


function AdvertisementProduct:getTwoDimensionalConstraint()
        return self.constraint
end

return AdvertisementProduct

