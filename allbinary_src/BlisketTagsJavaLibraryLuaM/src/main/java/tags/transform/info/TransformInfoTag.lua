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
-- package tags.transform.info

-- local JspTagException = require("javax.servlet.jsp.JspTagException")
local TagHelperFactoryInterface = require("admin.taghelpers.TagHelperFactoryInterface")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local AbResponseHandler = require("org.allbinary.logic.communication.http.request.AbResponseHandler")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local OutputTypeData = require("org.allbinary.logic.io.OutputTypeData")
local TransformInfoData = require("org.allbinary.logic.visual.transform.info.TransformInfoData")
local TransformInfoRequestHelperFactory = require("taghelpers.transform.info.TransformInfoRequestHelperFactory")
local ModifyTag = require("tags.ModifyTag")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TransformInfoTag = {}
TransformInfoTag.__index = TransformInfoTag
TransformInfoTag.className = "TransformInfoTag"
setmetatable(TransformInfoTag, {__index = ModifyTag})

function TransformInfoTag:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.name = nil
    self.storeName = nil
    self.objectFile = nil
    self.anyType = nil
    self.objectConfigFile = nil
    self.objectConfig = nil
    self.templateFile = nil
    self.template = nil
    self.dataFile = nil
    self.data = nil
    self.type = nil
end

function TransformInfoTag.new(...)
    local count = select("#", ...)
    if count == 0 then return TransformInfoTag._new0(...)
    elseif count == 1 then return TransformInfoTag._new1(...)
    end
end


function TransformInfoTag._new0()
    local self = setmetatable(ModifyTag.new(TransformInfoRequestHelperFactory.new()), TransformInfoTag)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function TransformInfoTag._new1(tagHelperFactoryInterface)
    local self = setmetatable(ModifyTag.new(tagHelperFactoryInterface), TransformInfoTag)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function TransformInfoTag:setName(value)
        self.name = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().NAME, self.name)
end


function TransformInfoTag:setStoreName(value)
        self.storeName = value
        self:getPropertiesHashMap():put(StoreFrontData.getInstance().NAME, self.storeName)
end


function TransformInfoTag:setObjectFile(value)
        self.objectFile = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().OBJECTFILENAME, self.objectFile)
end


function TransformInfoTag:setObject(value)
        self.anyType = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().OBJECT, self.anyType)
end


function TransformInfoTag:setTemplateFile(value)
        self.templateFile = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().TEMPLATEFILENAME, self.templateFile)
end


function TransformInfoTag:setTemplate(value)
        self.template = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().TEMPLATE, self.template)
end


function TransformInfoTag:setDataFile(value)
        self.dataFile = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().DATAFILENAME, self.dataFile)
end


function TransformInfoTag:setData(value)
        self.data = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().DATA, self.data)
end


function TransformInfoTag:setObjectConfigFile(value)
        self.objectConfigFile = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().OBJECTCONFIGFILENAME, self.objectConfigFile)
end


function TransformInfoTag:setObjectConfig(value)
        self.objectConfig = value
        self:getPropertiesHashMap():put(TransformInfoData.getInstance().OBJECTCONFIG, self.objectConfig)
end


function TransformInfoTag:setType(value)
        self.type = value
        self:getPropertiesHashMap():put(OutputTypeData.getInstance().NAME, self.type)
        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().JSPTAG) then
            self.logUtil:putF("TransformInfoTag type set: " .. self.type, self, "setType")
        end
end


function TransformInfoTag:getName()
        return self.name
end


function TransformInfoTag:getObjectFile()
        return self.objectFile
end


-- throws JspTagException
function TransformInfoTag:doStartTag()
        local try_ok, try_error = pcall(function()
            return ModifyTag.doStartTag(self)
        end)
        if not try_ok then
            local e = try_error
            AbResponseHandler.sendJspTagRedirect(self.pageContext, e)
            return self.SKIP_BODY
        end
end

return TransformInfoTag

