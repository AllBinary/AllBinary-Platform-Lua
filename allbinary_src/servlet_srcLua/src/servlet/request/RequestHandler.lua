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
-- package servlet.request

-- local io = require("java.io")
-- local net = require("java.net")
-- local servlet = require("javax.servlet")
-- local http = require("javax.servlet.http")
local LicensingException = require("org.allbinary.logic.system.security.licensing.LicensingException")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local WorkFlowInterface = require("org.allbinary.logic.control.workflow.WorkFlowInterface")
local RequestWorkFlowFactory = require("org.allbinary.logic.control.workflow.RequestWorkFlowFactory")
local HttpServlet = require("servlet.request.HttpServlet")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local RequestHandler = {}
RequestHandler.__index = RequestHandler
RequestHandler.className = "RequestHandler"
setmetatable(RequestHandler, {__index = HttpServlet})

function RequestHandler:_init_fields()
    self.logUtil = LogUtil.getInstance()
end

function RequestHandler.new()
    local self = setmetatable(HttpServlet.new(), RequestHandler)
    self:_init_fields()
    return self
end


-- throws ServletException
function RequestHandler:init(config)
        HttpServlet.init(self, config)
end


function RequestHandler:destroy()
end


-- throws ServletException, IOException
function RequestHandler:processRequest(request, response)
        local try_ok, try_error = pcall(function()
            response:setContentType("text/html")
            local out = response:getWriter()
            local workflowInterface = RequestWorkFlowFactory.getInstance(request, response, self:getServletConfig(), self:getServletContext())
            if workflowInterface ~= nil then
                out:print(workflowInterface:process())
            end
            out:flush()
            out:close()
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().SERVLETERROR) then
                self.logUtil:put("Servlet LicensingException", self, "processRequest()", e)
            end
            response:sendRedirect(self.abcs.globals.URLGLOBALS.LICENSEERRORPAGE)
        end
end


-- throws ServletException, IOException
function RequestHandler:doGet(request, response)
        self:processRequest(request, response)
end


-- throws ServletException, IOException
function RequestHandler:doPost(request, response)
        self:processRequest(request, response)
end


function RequestHandler:getServletInfo()
        return "WorkFlow Request Handler"
end

return RequestHandler

