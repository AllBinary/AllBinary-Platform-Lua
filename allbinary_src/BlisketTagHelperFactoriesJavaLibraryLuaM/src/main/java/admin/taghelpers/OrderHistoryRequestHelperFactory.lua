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
-- package admin.taghelpers

-- local HashMap = require("java.util.HashMap")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local TagHelperFactory = require("admin.taghelpers.TagHelperFactory")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local OrderHistoryRequestHelperFactory = {}
OrderHistoryRequestHelperFactory.__index = OrderHistoryRequestHelperFactory
OrderHistoryRequestHelperFactory.className = "OrderHistoryRequestHelperFactory"
setmetatable(OrderHistoryRequestHelperFactory, {__index = TagHelperFactory})

function OrderHistoryRequestHelperFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function OrderHistoryRequestHelperFactory.new()
    local self = setmetatable(TagHelperFactory.new(), OrderHistoryRequestHelperFactory)
    self:_init_fields()
    return self
end


-- throws LicensingException
function OrderHistoryRequestHelperFactory:getInstance(hashMap, pageContext)
        local try_ok, try_error = pcall(function()
            return OrderHistoryRequestHelper.new(hashMap, pageContext)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.GET_INSTANCE, e)
            end
            return nil
        end
end

return OrderHistoryRequestHelperFactory

