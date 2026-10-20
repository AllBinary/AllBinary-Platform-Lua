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
-- package tags.workflow.processing.basic

-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local DynamicObjectData = require("org.allbinary.business.DynamicObjectData")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StoreWorkFlowTag = require("tags.StoreWorkFlowTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--and remove the hidden fields
local BasicWorkFlowTag = {}
BasicWorkFlowTag.__index = BasicWorkFlowTag
BasicWorkFlowTag.className = "BasicWorkFlowTag"
setmetatable(BasicWorkFlowTag, {__index = StoreWorkFlowTag})

function BasicWorkFlowTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function BasicWorkFlowTag.new()
    local self = setmetatable(StoreWorkFlowTag.new(), BasicWorkFlowTag)
    self:_init_fields()
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


-- throws JspTagException
function BasicWorkFlowTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                self.logUtil:putF(self.commonStrings.START, self, self.tagStrings.DO_START_TAG)
            end
            self:getPropertiesHashMap():put(DynamicObjectData.NAME, "workflows.template.data.BasicStoreWorkFlow")
            return StoreWorkFlowTag.doStartTag(self)
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return BasicWorkFlowTag

