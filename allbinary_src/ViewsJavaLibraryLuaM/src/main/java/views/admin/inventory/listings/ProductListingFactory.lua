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
-- package views.admin.inventory.listings

local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local SearchRequest = require("org.allbinary.logic.control.search.SearchRequest")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ProductListingFactory = {}
ProductListingFactory.__index = ProductListingFactory
ProductListingFactory.className = "ProductListingFactory"


function ProductListingFactory.new()
    local self = setmetatable({}, ProductListingFactory)
    return self
end


function ProductListingFactory.getInstance(searchRequest)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error = pcall(function()
            return ProductListing.new(searchRequest)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().FACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                logUtil:put(commonStrings.EXCEPTION, "ProductListingFactory", commonStrings.GET_INSTANCE, e)
            end
            return nil
        end
end

return ProductListingFactory

