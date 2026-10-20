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
-- package org.allbinary.servlet.file

-- local IOException = require("java.io.IOException")
-- local InputStream = require("java.io.InputStream")
-- local HashMap = require("java.util.HashMap")
-- local ServletException = require("javax.servlet.ServletException")
-- local HttpServlet = require("javax.servlet.http.HttpServlet")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local HttpServletResponse = require("javax.servlet.http.HttpServletResponse")
local AuthenticationHelper = require("admin.taghelpers.AuthenticationHelper")
local AuthenticationHelperFactory = require("admin.taghelpers.AuthenticationHelperFactory")
local AuthenticationHelperUtil = require("admin.taghelpers.AuthenticationHelperUtil")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CloudStreamUtil = require("org.allbinary.logic.io.CloudStreamUtil")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local BlisketServletUtil = require("org.allbinary.servlet.BlisketServletUtil")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
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

local DownloadFileServlet = {}
DownloadFileServlet.__index = DownloadFileServlet
DownloadFileServlet.className = "DownloadFileServlet"
setmetatable(DownloadFileServlet, {__index = HttpServlet})

function DownloadFileServlet:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.DOWNLOAD = "download"
    self.DEFAULT_BUFFER_SIZE = 16384
end

function DownloadFileServlet.new()
    local self = setmetatable(HttpServlet.new(), DownloadFileServlet)
    self:_init_fields()
    return self
end


-- throws ServletException, IOException
function DownloadFileServlet:processRequest(request, response)
        local inputStream = nil
        local try_ok, try_error = pcall(function()
            BlisketServletUtil.getInstance():init(request)
            local requestPath = request:getRequestURI()
            if requestPath == nil then
                response:sendError(HttpServletResponse.SC_NOT_FOUND)
                return
            end
            local beginIndex = ((string.find(requestPath, self.DOWNLOAD, 1, true) or 0) - 1)
            local filePath = StringUtil.getInstance().EMPTY_STRING
            if beginIndex >= 0 then
                filePath = string.sub(requestPath, (beginIndex + #self.DOWNLOAD) + 1)
            else
                response:sendError(HttpServletResponse.SC_NOT_FOUND)
            end
            local file = AbFile.createAbFile(tostring(self.URLGLOBALS:getWebappPath()) .. filePath)
            if not file:exists() then
                response:sendError(HttpServletResponse.SC_NOT_FOUND)
                return
            end
            local hashMap = StdUtil.getInstance():createHashMap()
            local authenticationHelper = AuthenticationHelperFactory.new():getInstance(hashMap, request)
            if authenticationHelper:isAuthenticated() then
                if AuthenticationHelperUtil.getInstance():isAuthorized(authenticationHelper, filePath) then
                    inputStream = CloudStreamUtil.getInstance():getFile(file)
                    local contentType = self:getServletContext():getMimeType(file:getName())
                    if contentType == nil then
                        contentType = "application/octet-stream"
                    end
                    response:reset()
                    response:setBufferSize(self.DEFAULT_BUFFER_SIZE)
                    response:setContentType(contentType)
                    response:setHeader("Content-Length", tostring(file:length()))
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("attachment; filename=\"")
                    stringBuffer:append(file:getName())
                    stringBuffer:append(CommonSeps.getInstance().QUOTE)
                    response:setHeader("Content-Disposition", tostring(stringBuffer))
                    StreamUtil.getInstance():get(inputStream, response:getOutputStream(), java_new_array(0, 16348))
                else
                    response:sendError(HttpServletResponse.SC_UNAUTHORIZED, "You are not Authorized")
                end
            else
                response:sendError(HttpServletResponse.SC_UNAUTHORIZED, "Please Login")
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "processRequest()", e)
            end
            response:sendError(HttpServletResponse.SC_NOT_FOUND)
        end
        do -- finally
            StreamUtil.getInstance():close(response:getOutputStream())
            if not StreamUtil.getInstance():close(inputStream) then
            end
        end
end


-- throws ServletException, IOException
function DownloadFileServlet:doGet(request, response)
        self:processRequest(request, response)
end


-- throws ServletException, IOException
function DownloadFileServlet:doPost(request, response)
        self:processRequest(request, response)
end


function DownloadFileServlet:getServletInfo()
        return "Serves Up Cloud Files"
end

return DownloadFileServlet

