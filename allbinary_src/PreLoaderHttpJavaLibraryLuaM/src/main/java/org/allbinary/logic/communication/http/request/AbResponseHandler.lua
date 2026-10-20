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
-- package org.allbinary.logic.communication.http.request

-- local RequestDispatcher = require("javax.servlet.RequestDispatcher")
-- local ServletException = require("javax.servlet.ServletException")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local HttpServletResponse = require("javax.servlet.http.HttpServletResponse")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local FREEBLISKET_PATH_GLOBALS = require("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = require("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = require("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local AbResponseHandler = {}
AbResponseHandler.__index = AbResponseHandler
AbResponseHandler.className = "AbResponseHandler"

function AbResponseHandler:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function AbResponseHandler.new()
    local self = setmetatable({}, AbResponseHandler)
    self:_init_fields()
    return self
end


-- throws JspTagException
function AbResponseHandler.sendJspTagRedirect(pageContext, e)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                logUtil:put("Jsp Tag Exception", "AbResponseHandler", "sendJspRedirect()", e)
            end
            AbResponseHandler.sendRedirect(pageContext, self.FREEBLISKET_PATH_GLOBALS:getInstance().ERRORPAGE)
        end)
        if not try_ok then
            local e2 = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().LICENSINGERROR) then
                logUtil:put("Exception in Redirect Handling", "AbResponseHandler", "sendJspRedirect", e)
            end
            error(java_exception("JspTagException"), 0)
        end
end


-- throws ServletException
function AbResponseHandler.sendServletRedirect(pageContext, e)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                logUtil:put("Jsp Tag Exception", "AbResponseHandler", "sendJspRedirect()", e)
            end
            AbResponseHandler.sendRedirect(pageContext, self.FREEBLISKET_PATH_GLOBALS:getInstance().ERRORPAGE)
        end)
        if not try_ok then
            local e2 = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().LICENSINGERROR) then
                logUtil:put("Exception in Redirect Handling", "AbResponseHandler", "sendJspRedirect", e)
            end
            error(java_exception("ServletException"), 0)
        end
end


-- throws JspTagException
function AbResponseHandler.sendJspTagLicensingRedirect(pageContext, e)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                logUtil:put("Licensing Exception", "AbResponseHandler", "sendJspTagLicensingRedirect()", e)
            end
            AbResponseHandler.sendRedirect(pageContext, self.FREEBLISKET_PATH_GLOBALS:getInstance().LICENSEERRORPAGE)
        end)
        if not try_ok then
            local e2 = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().LICENSINGERROR) then
                logUtil:put("Exception in Redirect Handling", "AbResponseHandler", "sendJspTagLicensingRedirect", e)
            end
            error(java_exception("JspTagException"), 0)
        end
end


-- throws ServletException
function AbResponseHandler.sendServletLicensingRedirect(pageContext, e)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                logUtil:put("Licensing Exception", "AbResponseHandler", "sendServletLicensingRedirect()", e)
            end
            AbResponseHandler.sendRedirect(pageContext, self.FREEBLISKET_PATH_GLOBALS:getInstance().LICENSEERRORPAGE)
        end)
        if not try_ok then
            local e2 = try_error
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().LICENSINGERROR) then
                logUtil:put("Exception in Redirect Handling", "AbResponseHandler", "sendServletLicensingRedirect", e)
            end
            error(java_exception("ServletException"), 0)
        end
end


-- throws Exception
function AbResponseHandler.sendRedirect(pageContext, page)
        local request = pageContext:getRequest()
        local response = pageContext:getResponse()
        local requestDispatcher = request:getRequestDispatcher(page)
        if response:isCommitted() then
            response:sendRedirect(page)
        else
            local try_ok, try_error = pcall(function()
                requestDispatcher:forward(request, response)
            end)
            if not try_ok then
                local e = try_error
                pageContext:getOut():print("Error: " .. page)
            end
        end
end

return AbResponseHandler

