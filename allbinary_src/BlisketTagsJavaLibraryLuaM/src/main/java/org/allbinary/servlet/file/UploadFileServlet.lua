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
local FileUploadData = require("org.allbinary.logic.communication.http.file.upload.FileUploadData")
local HttpFileUploadUtil = require("org.allbinary.logic.communication.http.file.upload.HttpFileUploadUtil")
local HttpRequestUtil = require("org.allbinary.logic.communication.http.request.HttpRequestUtil")
local MultipartRequestParams = require("org.allbinary.logic.communication.http.request.MultipartRequestParams")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbFileOutputStream = require("org.allbinary.logic.io.AbFileOutputStream")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local BlisketServletUtil = require("org.allbinary.servlet.BlisketServletUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local FileItem = require("org.apache.commons.fileupload.FileItem")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local UploadFileServlet = {}
UploadFileServlet.__index = UploadFileServlet
UploadFileServlet.className = "UploadFileServlet"
setmetatable(UploadFileServlet, {__index = HttpServlet})

function UploadFileServlet:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.requestHashMap = nil
    self.fileName = nil
end

function UploadFileServlet.new()
    local self = setmetatable(HttpServlet.new(), UploadFileServlet)
    self:_init_fields()
    return self
end


-- throws ServletException, IOException
function UploadFileServlet:processRequest(request, response)
        local isError = false
        local inputStream = nil
        local try_ok, try_error = pcall(function()
            BlisketServletUtil.getInstance():init(request)
            self.requestHashMap = MultipartRequestParams.new(request):toHashMap()
            local filePath = self.requestHashMap:get(FileUploadData.getInstance().UPLOAD_TO_FILE_PATH)
            if filePath == nil then
                isError = true
                response:sendError(HttpServletResponse.SC_NOT_FOUND)
                return
            end
            local hashMap = StdUtil.getInstance():createHashMap()
            local authenticationHelper = AuthenticationHelperFactory.new():getInstance(hashMap, request)
            if authenticationHelper:isAuthenticated() then
                if AuthenticationHelperUtil.getInstance():isAuthorized(authenticationHelper, filePath) then
                    self:saveFile(filePath)
                    response:setContentType("text/plain")
                    response:getOutputStream():write({string.byte("OK!", 1, -1)})
                else
                    isError = true
                    response:sendError(HttpServletResponse.SC_UNAUTHORIZED, "You are not Authorized")
                end
            else
                isError = true
                response:sendError(HttpServletResponse.SC_UNAUTHORIZED, "Please Login")
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "processRequest()", e)
            end
            isError = true
            response:sendError(HttpServletResponse.SC_NOT_FOUND)
        end
        do -- finally
            if not isError then
                StreamUtil.getInstance():close(response:getOutputStream())
            end
            if not StreamUtil.getInstance():close(inputStream) then
            end
        end
end


-- throws Exception
function UploadFileServlet:saveFile(filePath)
        local fileOutputStream = nil
        local try_ok, try_error = pcall(function()
            local fileItem = self.requestHashMap:get(FileUploadData.getInstance().FILE_DATA)
            if fileItem ~= nil and fileItem:getSize() > 1 then
                self.fileName = HttpRequestUtil.getInstance():generateFileName(fileItem:getName())
                if ("/" == "" or string.sub(filePath, -#"/") == "/") or ("\\" == "" or string.sub(filePath, -#"\\") == "\\") then
                    filePath = filePath .. self.fileName
                end
                local file = AbFile.createAbFile(tostring(self.URLGLOBALS:getWebappPath()) .. filePath)
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().HTTPREQUEST) then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append("Uploaded File: ")
                    stringBuffer:append(self.fileName)
                    stringBuffer:append(" New File: ")
                    stringBuffer:append(file:getPath())
                    self.logUtil:putF(tostring(stringBuffer), self, "saveFile()")
                end
                HttpFileUploadUtil.log(fileItem)
                local byteArray = fileItem:get()
                if file:isFile() then
                    file:delete()
                    file:createNewFile()
                end
                fileOutputStream = AbFileOutputStream.createFromAbFile(file)
                fileOutputStream:write(byteArray)
            end
        end)
        do -- finally
            if fileOutputStream ~= nil then
                fileOutputStream:close()
            end
        end
        if not try_ok then error(try_error, 0) end
end


-- throws ServletException, IOException
function UploadFileServlet:doGet(request, response)
        self:processRequest(request, response)
end


-- throws ServletException, IOException
function UploadFileServlet:doPost(request, response)
        self:processRequest(request, response)
end


function UploadFileServlet:getServletInfo()
        return "Upload Cloud Files"
end

return UploadFileServlet

