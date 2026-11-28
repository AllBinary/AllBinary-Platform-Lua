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

local AbResponseHandler = {}
package.loaded["org.allbinary.logic.communication.http.request.AbResponseHandler"] = AbResponseHandler

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

-- local RequestDispatcher = require("javax.servlet.RequestDispatcher")
-- local ServletException = require("javax.servlet.ServletException")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local HttpServletResponse = require("javax.servlet.http.HttpServletResponse")
-- local JspTagException = require("javax.servlet.jsp.JspTagException")
-- local PageContext = require("javax.servlet.jsp.PageContext")
local FREEBLISKET_PATH_GLOBALS = java_lazy("org.allbinary.globals.FREEBLISKET_PATH_GLOBALS")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table AbResponseHandler is declared before the requires
AbResponseHandler.__index = AbResponseHandler
AbResponseHandler.className = "AbResponseHandler"
AbResponseHandler.javaClassName = "org.allbinary.logic.communication.http.request.AbResponseHandler"

function AbResponseHandler:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function AbResponseHandler._jinit(self)
    AbResponseHandler._init_fields(self)
    return self
end

function AbResponseHandler.new(...)
    local self = setmetatable({}, AbResponseHandler)
    AbResponseHandler._jinit(self, ...)
    return self
end


-- throws JspTagException
function AbResponseHandler.sendJspTagRedirect(pageContext, e)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                logUtil:put("Jsp Tag Exception", "AbResponseHandler", "sendJspRedirect()", e)
            end
            AbResponseHandler.sendRedirect(pageContext, FREEBLISKET_PATH_GLOBALS.getInstance().ERRORPAGE)
        end)
        if not try_ok then
            local e2 = try_error
            if type(e2) ~= "table" then e2 = require("java.lang.RuntimeException").new(tostring(e2)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().LICENSINGERROR) then
                logUtil:put("Exception in Redirect Handling", "AbResponseHandler", "sendJspRedirect", e)
            end
            error(java_exception("JspTagException"), 0)
        end
end


-- throws ServletException
function AbResponseHandler.sendServletRedirect(pageContext, e)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                logUtil:put("Jsp Tag Exception", "AbResponseHandler", "sendJspRedirect()", e)
            end
            AbResponseHandler.sendRedirect(pageContext, FREEBLISKET_PATH_GLOBALS.getInstance().ERRORPAGE)
        end)
        if not try_ok then
            local e2 = try_error
            if type(e2) ~= "table" then e2 = require("java.lang.RuntimeException").new(tostring(e2)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().LICENSINGERROR) then
                logUtil:put("Exception in Redirect Handling", "AbResponseHandler", "sendJspRedirect", e)
            end
            error(java_exception("ServletException"), 0)
        end
end


-- throws JspTagException
function AbResponseHandler.sendJspTagLicensingRedirect(pageContext, e)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                logUtil:put("Licensing Exception", "AbResponseHandler", "sendJspTagLicensingRedirect()", e)
            end
            AbResponseHandler.sendRedirect(pageContext, FREEBLISKET_PATH_GLOBALS.getInstance().LICENSEERRORPAGE)
        end)
        if not try_ok then
            local e2 = try_error
            if type(e2) ~= "table" then e2 = require("java.lang.RuntimeException").new(tostring(e2)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().LICENSINGERROR) then
                logUtil:put("Exception in Redirect Handling", "AbResponseHandler", "sendJspTagLicensingRedirect", e)
            end
            error(java_exception("JspTagException"), 0)
        end
end


-- throws ServletException
function AbResponseHandler.sendServletLicensingRedirect(pageContext, e)
        local logUtil = LogUtil.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().JSPTAGERROR) then
                logUtil:put("Licensing Exception", "AbResponseHandler", "sendServletLicensingRedirect()", e)
            end
            AbResponseHandler.sendRedirect(pageContext, FREEBLISKET_PATH_GLOBALS.getInstance().LICENSEERRORPAGE)
        end)
        if not try_ok then
            local e2 = try_error
            if type(e2) ~= "table" then e2 = require("java.lang.RuntimeException").new(tostring(e2)) end
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
            local try_ok, try_error, try_value = pcall(function()
                requestDispatcher:forward(request, response)
            end)
            if not try_ok then
                local e = try_error
                if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                pageContext:getOut():print(require("allbinary_java").to_string("Error: ") .. require("allbinary_java").to_string(page))
            end
        end
end

return AbResponseHandler

