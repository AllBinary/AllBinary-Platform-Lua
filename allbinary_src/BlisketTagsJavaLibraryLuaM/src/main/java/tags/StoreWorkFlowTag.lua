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

-- local Method = require("java.lang.reflect.Method")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local TransformInfoData = require("org.allbinary.logic.visual.transform.info.TransformInfoData")
local StoreTagWorkFlowHelperFactory = require("taghelpers.StoreTagWorkFlowHelperFactory")
local HelperTag = require("tags.HelperTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--and hidden field removal
local StoreWorkFlowTag = {}
StoreWorkFlowTag.__index = StoreWorkFlowTag
StoreWorkFlowTag.className = "StoreWorkFlowTag"
setmetatable(StoreWorkFlowTag, {__index = HelperTag})

function StoreWorkFlowTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.viewName = nil
    self.viewFile = nil
end


function StoreWorkFlowTag.new()
    local self = setmetatable(HelperTag.new(StoreTagWorkFlowHelperFactory.new()), StoreWorkFlowTag)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function StoreWorkFlowTag:setName(value)
        self.viewName = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().NAME, self.viewName)
end


-- throws Exception
function StoreWorkFlowTag:process()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.PROCESS)
            end
            local helperClass = getmetatable(self:getHelper())
            local method = helperClass:getMethod(self.commonStrings.PROCESS, nil)
            local result = method:invoke(self:getHelper(), nil)
            return math.tointeger(result // 1)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.PROCESS, e)
            end
            error(e, 0)
        end
end


-- throws JspTagException
function StoreWorkFlowTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                self.logUtil:putF(self.commonStrings.START, self, self.tagStrings.DO_START_TAG)
            end
            self:setHelper()
            return self:process()
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return StoreWorkFlowTag

