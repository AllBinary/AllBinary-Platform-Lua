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
-- package tags

-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationTransformTag = require("tags.ValidationTransformTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local StoreValidationTransformTag = {}
StoreValidationTransformTag.__index = StoreValidationTransformTag
StoreValidationTransformTag.className = "StoreValidationTransformTag"
setmetatable(StoreValidationTransformTag, {__index = ValidationTransformTag})

function StoreValidationTransformTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.storeName = nil
end


function StoreValidationTransformTag.new()
    local self = setmetatable(ValidationTransformTag.new(), StoreValidationTransformTag)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function StoreValidationTransformTag:setStoreName(value)
        self.storeName = value
        self:getPropertiesHashMap():put(StoreFrontData.getInstance().NAME, self.storeName)
end


-- throws JspTagException
function StoreValidationTransformTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                self.logUtil:putF("Tag Start", self, self.tagStrings.DO_START_TAG)
            end
            return ValidationTransformTag.doStartTag(self)
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return StoreValidationTransformTag

