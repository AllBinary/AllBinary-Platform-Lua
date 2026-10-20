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
local TagHelperFactoryInterface = require("admin.taghelpers.TagHelperFactoryInterface")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local ViewHelperFactory = require("taghelpers.ViewHelperFactory")
local TransformInfoTag = require("tags.transform.info.TransformInfoTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformTag = {}
TransformTag.__index = TransformTag
TransformTag.className = "TransformTag"
setmetatable(TransformTag, {__index = TransformInfoTag})

function TransformTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function TransformTag.new(...)
    local count = select("#", ...)
    if count == 0 then return TransformTag._new0(...)
    elseif count == 1 then return TransformTag._new1(...)
    end
end


function TransformTag._new0()
    local self = setmetatable(TransformInfoTag.new(ViewHelperFactory.new()), TransformTag)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


function TransformTag._new1(tagHelperFactoryInterface)
    local self = setmetatable(TransformInfoTag.new(tagHelperFactoryInterface), TransformTag)
    self:_init_fields()
        -- super(...) made self above
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
            self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        end
    return self
end


-- throws Exception
function TransformTag:view()
        local try_ok, try_error = pcall(function()
            local result = getmetatable(self:getHelper()):getMethod("view", nil):invoke(self:getHelper(), nil)
            return result
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end


-- throws JspTagException
function TransformTag:doStartTag()
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                self.logUtil:putF("Creating with: \n" .. tostring(self:getPropertiesHashMap()), self, self.tagStrings.DO_START_TAG)
            end
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("ViewTag Start For: ")
                stringBuffer:append(self:getName())
                stringBuffer:append("\nViewFile: ")
                stringBuffer:append(self:getObjectFile())
                self.logUtil:putF(tostring(stringBuffer), self, self.tagStrings.DO_START_TAG)
            end
            self:setHelper()
            self.pageContext:getOut():print(self:view())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
                self.logUtil:putF("Tag End", self, self.tagStrings.DO_START_TAG)
            end
            return self.SKIP_BODY
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagLicensingRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return TransformTag

