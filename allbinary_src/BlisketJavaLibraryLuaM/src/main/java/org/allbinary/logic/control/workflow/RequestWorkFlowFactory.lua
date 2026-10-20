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
-- package org.allbinary.logic.control.workflow

-- local HashMap = require("java.util.HashMap")
-- local ServletConfig = require("javax.servlet.ServletConfig")
-- local ServletContext = require("javax.servlet.ServletContext")
-- local ServletRequest = require("javax.servlet.ServletRequest")
-- local ServletResponse = require("javax.servlet.ServletResponse")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local WorkFlowEntityFactory = require("org.allbinary.data.tables.workflow.WorkFlowEntityFactory")
local WeblisketSession = require("org.allbinary.logic.communication.http.request.session.WeblisketSession")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RequestWorkFlowFactory = {}
RequestWorkFlowFactory.__index = RequestWorkFlowFactory
RequestWorkFlowFactory.className = "RequestWorkFlowFactory"


function RequestWorkFlowFactory.new()
    local self = setmetatable({}, RequestWorkFlowFactory)
    return self
end


-- throws Exception, LicensingException
function RequestWorkFlowFactory.getInstance(request, response, servletConfig, servletContext)
        local httpRequest = request
        local requestCommand = httpRequest:getPathInfo()
        local index = ((string.find(requestCommand, AbPathData.getInstance().SEPARATOR, 1, true) or 0) - 1)
        local storeName = string.sub(requestCommand, (0) + 1, index)
        local requestName = string.sub(requestCommand, (index) + 1, #requestCommand)
        return WorkFlowEntityFactory.getInstance():create2():get(requestName, storeName)
end


-- throws Exception, LicensingException
-- Java overloaded method: Lua keeps the last definition
function RequestWorkFlowFactory.getInstance(hashMap, pageContext)
        local workFlowName = pageContext:getRequest():getParameter(WorkFlowData.getInstance().NAME)
        local weblisketSession = WeblisketSession.new(hashMap, pageContext)
        local storeName = weblisketSession:getStoreName()
        return WorkFlowEntityFactory.getInstance():create2():get(workFlowName, storeName)
end

return RequestWorkFlowFactory

