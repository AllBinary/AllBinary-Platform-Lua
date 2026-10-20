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
-- package org.allbinary.servlet

-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local IOException = require("java.io.IOException")
-- local InputStream = require("java.io.InputStream")
-- local ServletException = require("javax.servlet.ServletException")
-- local HttpServlet = require("javax.servlet.http.HttpServlet")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local HttpServletResponse = require("javax.servlet.http.HttpServletResponse")
local URLGLOBALS = require("org.allbinary.globals.URLGLOBALS")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local CloudStreamUtil = require("org.allbinary.logic.io.CloudStreamUtil")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local CommonStrings = require("org.allbinary.string.CommonStrings")

-- Java library java.io.ByteArrayOutputStream
local function java_byte_array_output_stream()
    local stream = {buffer = {}}
    function stream:write(value, offset, length)
        if type(value) == "table" then
            local first = (offset or 0) + 1
            local last = first + (length or #value) - 1
            for index = first, last do self.buffer[#self.buffer + 1] = string.char(value[index] % 256) end
        elseif type(value) == "number" then
            self.buffer[#self.buffer + 1] = string.char(value % 256)
        else
            self.buffer[#self.buffer + 1] = tostring(value)
        end
    end
    function stream:toString() return table.concat(self.buffer) end
    function stream:size() return #table.concat(self.buffer) end
    function stream:reset() self.buffer = {} end
    function stream:flush() end
    function stream:close() end
    return setmetatable(stream, {__tostring = function(self) return table.concat(self.buffer) end})
end

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

local ImageServlet = {}
ImageServlet.__index = ImageServlet
ImageServlet.className = "ImageServlet"
setmetatable(ImageServlet, {__index = HttpServlet})

function ImageServlet:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end

function ImageServlet.new()
    local self = setmetatable(HttpServlet.new(), ImageServlet)
    self:_init_fields()
    return self
end


-- throws ServletException, IOException
function ImageServlet:processRequest(request, response)
        local inputStream = nil
        local try_ok, try_error = pcall(function()
            BlisketServletUtil.getInstance():init(request)
            local requestURI = request:getRequestURI()
            local file = AbFile.createAbFile(tostring(self.URLGLOBALS:getWebappPath()) .. requestURI)
            inputStream = CloudStreamUtil.getInstance():getFileLocal(file)
            local outputStream = java_byte_array_output_stream()
            local byteArray = StreamUtil.getInstance():getByteArray(inputStream, outputStream, java_new_array(0, 16384))
            response:setContentType("image/jpeg;charset=utf-8")
            response:getOutputStream():write(byteArray)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "processRequest()", e)
            end
        end
        do -- finally
            StreamUtil.getInstance():close(response:getOutputStream())
            if not StreamUtil.getInstance():close(inputStream) then
                response:sendError(HttpServletResponse.SC_NOT_FOUND)
            end
        end
end


-- throws ServletException, IOException
function ImageServlet:doGet(request, response)
        self:processRequest(request, response)
end


-- throws ServletException, IOException
function ImageServlet:doPost(request, response)
        self:processRequest(request, response)
end


function ImageServlet:getServletInfo()
        return "Serves Up Image"
end

return ImageServlet

