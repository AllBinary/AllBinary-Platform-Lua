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
-- package org.allbinary.logic.control.workflow.request

-- local Calendar = require("java.util.Calendar")
-- local HashMap = require("java.util.HashMap")
-- local Set = require("java.util.Set")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = require("org.allbinary.business.entry.EntryData")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local DomDocumentHelper = require("org.allbinary.data.tree.dom.document.DomDocumentHelper")
local XmlDocumentHelper = require("org.allbinary.data.tree.dom.document.XmlDocumentHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local RequestParams = require("org.allbinary.logic.communication.http.request.RequestParams")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local WorkFlowData = require("org.allbinary.logic.control.workflow.WorkFlowData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicWorkFlow = {}
BasicWorkFlow.__index = BasicWorkFlow
BasicWorkFlow.className = "BasicWorkFlow"

function BasicWorkFlow:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.workFlowDoc = nil
    self.workFlowName = nil
    self.storeName = nil
end

function BasicWorkFlow.new(...)
    local count = select("#", ...)
    if count == 0 then return BasicWorkFlow._new0(...)
    elseif count == 2 then return BasicWorkFlow._new2(...)
    elseif count == 1 then return BasicWorkFlow._new1(...)
    end
end


function BasicWorkFlow._new0()
    local self = setmetatable({}, BasicWorkFlow)
    self:_init_fields()
        self.workFlowName = StringUtil.getInstance().EMPTY_STRING
        self.workFlowDoc = DomDocumentHelper.create()
        local workFlowNode = self.workFlowDoc:createElement(WorkFlowData.getInstance().WORKFLOW)
        self.workFlowDoc:appendChild(workFlowNode)
    return self
end


function BasicWorkFlow._new2(hashMap, pageContext)
    local self = setmetatable({}, BasicWorkFlow)
    self:_init_fields()
        local weblisketSession = WeblisketSession.new(hashMap, pageContext)
        self.storeName = weblisketSession:getStoreName()
        local requestHashMap = RequestParams.new(pageContext):toHashMap()
        self.workFlowName = requestHashMap:get(WorkFlowData.getInstance().NAME)
        self.workFlowDoc = DomDocumentHelper.create(requestHashMap:get(WorkFlowData.getInstance().DATA))
    return self
end


function BasicWorkFlow._new1(hashMap)
    local self = setmetatable({}, BasicWorkFlow)
    self:_init_fields()
        self.workFlowName = hashMap:get(WorkFlowData.getInstance().NAME)
        self.storeName = hashMap:get(StoreFrontData.getInstance().NAME)
        self.workFlowDoc = DomDocumentHelper.create(hashMap:get(WorkFlowData.getInstance().DATA))
    return self
end


function BasicWorkFlow:getName()
        return self.workFlowName
end


function BasicWorkFlow:getStoreName()
        return self.storeName
end


function BasicWorkFlow:getKey()
        return self:getName()
end


-- throws Exception
function BasicWorkFlow:toVector()
        local values = BasicArrayListD.new()
        values:add(self.workFlowName)
        values:add(self.storeName)
        values:add(XmlDocumentHelper.toString(self.workFlowDoc))
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        values:add(time)
        values:add(time)
        return values
end


-- throws Exception
function BasicWorkFlow:toHashMap()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(WorkFlowData.getInstance().NAME, self.workFlowName)
        hashMap:put(StoreFrontData.getInstance().NAME, self.storeName)
        hashMap:put(WorkFlowData.getInstance().DATA, XmlDocumentHelper.toString(self.workFlowDoc))
        local calendar = Calendar.getInstance()
        local time = tostring(tostring(calendar:getTimeInMillis()))
        hashMap:put(EntryData.getInstance().LASTMODIFIED, time)
        return hashMap
end


function BasicWorkFlow:toXmlNode(document)
        local try_ok, try_error = pcall(function()
            local hashMap = self:toHashMap()
            local keySet = hashMap:keySet()
            local node = document:createElement(WorkFlowData.getInstance().WORKFLOW)
            local nameArray = keySet:toArray()
            local size = (nameArray.n or #nameArray)
            for index = 0, size - 1 do
                local name = nameArray[index + 1]
                local value = hashMap:get(name)
                node:appendChild(ModDomHelper.createNameValueNodes(document, name, value))
            end
            return node
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toXmlNode()", e)
            end
            return nil
        end
end


function BasicWorkFlow:toXmlDoc()
        local try_ok, try_error = pcall(function()
            return self.workFlowDoc
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toXmlDoc()", e)
            end
            return nil
        end
end


function BasicWorkFlow:isValid()
        local try_ok, try_error = pcall(function()
            local returnBoolean = true
            if self.workFlowName == nil then
                returnBoolean = false
            end
            return returnBoolean
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to validate", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
end


function BasicWorkFlow:validationInfo()
        local try_ok, try_error = pcall(function()
            local stringBuffer = StringMaker.new()
            if self.workFlowName == nil then
                stringBuffer:append("No WorkFlow name specified.")
            end
            return tostring(stringBuffer)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Getting Validation Info"
        end
end


function BasicWorkFlow:toValidationInfoDoc()
        return nil
end


function BasicWorkFlow:toValidationInfoNode(document)
        return nil
end

return BasicWorkFlow

