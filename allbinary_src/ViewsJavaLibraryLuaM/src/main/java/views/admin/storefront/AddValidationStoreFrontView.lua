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
-- package views.admin.storefront

-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
local StoreFront = require("org.allbinary.business.context.modules.storefront.StoreFront")
local StoreFrontFactory = require("org.allbinary.business.context.modules.storefront.StoreFrontFactory")
local StoreFrontInterface = require("org.allbinary.business.context.modules.storefront.StoreFrontInterface")
local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local ValidationComponentInterface = require("org.allbinary.logic.control.validate.ValidationComponentInterface")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local AbPath = require("org.allbinary.logic.io.path.AbPath")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local HttpContextView = require("views.business.context.HttpContextView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AddValidationStoreFrontView = {}
AddValidationStoreFrontView.__index = AddValidationStoreFrontView
AddValidationStoreFrontView.className = "AddValidationStoreFrontView"
setmetatable(AddValidationStoreFrontView, {__index = HttpContextView})

function AddValidationStoreFrontView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.newStoreFrontInterface = nil
end


function AddValidationStoreFrontView.new(transformInfoInterface)
    local self = setmetatable(HttpContextView.new(transformInfoInterface), AddValidationStoreFrontView)
    self:_init_fields()
        -- super(...) made self above
        self.newStoreFrontInterface = StoreFront.new(self:getPageContext():getRequest())
        if self.newStoreFrontInterface:getName() == nil then
            self.newStoreFrontInterface:setName(self:getWeblisketSession():getStoreName())
        end
    return self
end


function AddValidationStoreFrontView:isValid()
        local try_ok, try_error = pcall(function()
            local valid = true
            if self.newStoreFrontInterface:isValid() == false then
                valid = false
            end
            if StoreFrontFactory.getInstance(self.newStoreFrontInterface:getName()) ~= nil then
                valid = false
            end
            if AbFile.createAbFileFromAbPath(AbPath.new(self:getStoreViewsPath(), StringUtil.getInstance().EMPTY_STRING)):isFile() then
                valid = false
            end
            return valid
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to validate form", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


-- throws Exception
function AddValidationStoreFrontView:getStoreViewsPath()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.URLGLOBALS:getMainPath())
        stringBuffer:append(self.FREEBLISKET_PATH_GLOBALS:getInstance().XSLPATH)
        stringBuffer:append(self.newStoreFrontInterface:getName())
        return tostring(stringBuffer)
end


function AddValidationStoreFrontView:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            if self.newStoreFrontInterface:isValid() == false then
                stringBuffer:append(self.newStoreFrontInterface:validationInfo())
            end
            if StoreFrontFactory.getInstance(self.newStoreFrontInterface:getName()) ~= nil then
                stringBuffer:append("Store name already used<br/>")
            end
            if AbFile.createAbFileFromAbPath(AbPath.new(self:getStoreViewsPath(), StringUtil.getInstance().EMPTY_STRING)):isFile() then
                stringBuffer:append("Store name clashes with template name<br/>")
            end
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
end


function AddValidationStoreFrontView:toValidationInfoDoc()
        return nil
end


function AddValidationStoreFrontView:toValidationInfoNode(document)
        return nil
end


-- throws Exception
function AddValidationStoreFrontView:view()
        return self.views.ValidationOnlyTempUtil:getInstance():view(self)
end

return AddValidationStoreFrontView

