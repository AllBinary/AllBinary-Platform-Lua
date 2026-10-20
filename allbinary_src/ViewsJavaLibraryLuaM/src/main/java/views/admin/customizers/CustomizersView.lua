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
-- package views.admin.customizers

-- local Arrays = require("java.util.Arrays")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local TransformInfoEntityBuilder = require("org.allbinary.data.tables.transform.info.TransformInfoEntityBuilder")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local GLOBALS2 = require("org.allbinary.globals.GLOBALS2")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringComparator = require("org.allbinary.logic.control.sort.StringComparator")
local CustomizerTransformInfoData = require("org.allbinary.logic.visual.transform.info.CustomizerTransformInfoData")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformTemplateCustomizerData = require("org.allbinary.logic.visual.transform.template.customizer.TransformTemplateCustomizerData")
local TransformTemplateCustomizersData = require("org.allbinary.logic.visual.transform.template.customizer.TransformTemplateCustomizersData")
local BodyData = require("org.allbinary.logic.visual.transform.template.customizer.bodies.BodyData")
local TitleData = require("org.allbinary.logic.visual.transform.template.customizer.widgets.title.TitleData")
local TransformTemplateCustomizerUtil = require("org.allbinary.logic.visual.transform.template.util.TransformTemplateCustomizerUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local HttpStoreComponentView = require("views.business.context.modules.storefront.HttpStoreComponentView")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local CustomizersView = {}
CustomizersView.__index = CustomizersView
CustomizersView.className = "CustomizersView"
setmetatable(CustomizersView, {__index = HttpStoreComponentView})

function CustomizersView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.customizersVector = nil
end


function CustomizersView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), CustomizersView)
    self:_init_fields()
        -- super(...) made self above
        self.customizersVector = TransformInfoEntityBuilder.getInstance():getNames(self:getWeblisketSession():getStoreName())
    return self
end


function CustomizersView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            local node = document:createElement(TransformTemplateCustomizersData.NAME)
            local unsortedCustomizerViewVector = BasicArrayListD.new()
            local size = self.customizersVector:size()
            for index = 0, size - 1 do
                local viewName = self.customizersVector:get(index)
                if ((string.find(viewName, CustomizerTransformInfoData.NAME, 1, true) or 0) - 1) > 0 and ((string.find(viewName, self.GLOBALS2.EDIT, 1, true) or 0) - 1) > 0 and ((string.find(viewName, BodyData.getInstance().VIEWNAMEKEY, 1, true) or 0) - 1) > 0 and ((string.find(viewName, TitleData.getInstance().VIEWNAMEKEY, 1, true) or 0) - 1) > 0 then
                    unsortedCustomizerViewVector:add(viewName)
                end
            end
            local objectArray = unsortedCustomizerViewVector:toArray()
            Arrays.sort(objectArray, StringComparator.new())
            for index = 0, (objectArray.n or #objectArray) - 1 do
                local viewName = objectArray[index + 1]
                local viewNameNode = ModDomHelper.createNameValueNodes(document, TransformTemplateCustomizerData.NAME, viewName, TransformTemplateCustomizerUtil.getInstance():getPageNameHack(viewName, self:getWeblisketSession():getStoreName()))
                node:appendChild(viewNameNode)
            end
            return node
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().XSLLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.FAILURE, self, "toXmlNode", e)
            end
            return nil
        end
end


function CustomizersView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end


-- throws Exception
function CustomizersView:view()
        local try_ok, try_error = pcall(function()
            self:addDomNodeInterfaces()
            return HttpStoreComponentView.view(self)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "view()", e)
            end
            error(e, 0)
        end
end

return CustomizersView

