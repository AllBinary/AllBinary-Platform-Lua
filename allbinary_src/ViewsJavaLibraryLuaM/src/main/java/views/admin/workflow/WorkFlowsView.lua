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
-- package views.admin.workflow

local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local WorkFlowEntityFactory = require("org.allbinary.data.tables.workflow.WorkFlowEntityFactory")
local DomNodeInterface = require("org.allbinary.data.tree.dom.DomNodeInterface")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local WorkFlowData = require("org.allbinary.logic.control.workflow.WorkFlowData")
local WorkFlowInterface = require("org.allbinary.logic.control.workflow.WorkFlowInterface")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
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

local WorkFlowsView = {}
WorkFlowsView.__index = WorkFlowsView
WorkFlowsView.className = "WorkFlowsView"
setmetatable(WorkFlowsView, {__index = HttpStoreComponentView})

function WorkFlowsView:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.workFlowsVector = nil
end


function WorkFlowsView.new(transformInfoInterface)
    local self = setmetatable(HttpStoreComponentView.new(transformInfoInterface), WorkFlowsView)
    self:_init_fields()
        -- super(...) made self above
        self.workFlowsVector = WorkFlowEntityFactory.getInstance():create2():get(self:getWeblisketSession():getStoreName())
    return self
end


function WorkFlowsView:addDomNodeInterfaces()
        self:addDomNodeInterface(self)
end


-- throws Exception
function WorkFlowsView:view()
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


function WorkFlowsView:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            local node = document:createElement(WorkFlowData.getInstance().WORKFLOWS)
            local size = self.workFlowsVector:size()
            for index = 0, size - 1 do
                local workFlowInterface = self.workFlowsVector:get(index)
            end
            return node
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toXmlNode()", e)
            end
            return nil
        end
end

return WorkFlowsView

