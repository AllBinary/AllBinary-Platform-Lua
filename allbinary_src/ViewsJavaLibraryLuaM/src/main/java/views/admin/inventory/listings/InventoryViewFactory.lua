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
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local InventorySearch = require("views.generic.inventory.InventorySearch")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InventoryViewFactory = {}
InventoryViewFactory.__index = InventoryViewFactory
InventoryViewFactory.className = "InventoryViewFactory"


function InventoryViewFactory.new()
    local self = setmetatable({}, InventoryViewFactory)
    return self
end


-- throws LicensingException
function InventoryViewFactory.getInstance(searchRequest)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error = pcall(function()
            return InventorySearch.new(searchRequest)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                local commonStrings = CommonStrings.getInstance()
                logUtil:put(commonStrings.EXCEPTION, "InventoryViewFactory", "getInstance(SearchRequest)", e)
            end
            return nil
        end
end

return InventoryViewFactory

