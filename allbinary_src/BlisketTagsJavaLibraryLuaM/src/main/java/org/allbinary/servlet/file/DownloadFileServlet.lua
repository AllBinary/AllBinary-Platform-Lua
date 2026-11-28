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

local DownloadFileServlet = {}
package.loaded["org.allbinary.servlet.file.DownloadFileServlet"] = DownloadFileServlet

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

-- local IOException = require("java.io.IOException")
local InputStream = java_lazy("java.io.InputStream")
local HashMap = java_lazy("java.util.HashMap")
-- local ServletException = require("javax.servlet.ServletException")
-- local HttpServlet = require("javax.servlet.http.HttpServlet")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local HttpServletResponse = require("javax.servlet.http.HttpServletResponse")
local AuthenticationHelper = java_lazy("admin.taghelpers.AuthenticationHelper")
local AuthenticationHelperFactory = java_lazy("admin.taghelpers.AuthenticationHelperFactory")
local AuthenticationHelperUtil = java_lazy("admin.taghelpers.AuthenticationHelperUtil")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CloudStreamUtil = java_lazy("org.allbinary.logic.io.CloudStreamUtil")
local StreamUtil = java_lazy("org.allbinary.logic.io.StreamUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local BlisketServletUtil = java_lazy("org.allbinary.servlet.BlisketServletUtil")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_class_matches(class, name)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
end
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
end

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table DownloadFileServlet is declared before the requires
DownloadFileServlet.__index = DownloadFileServlet
DownloadFileServlet.className = "DownloadFileServlet"
DownloadFileServlet.javaClassName = "org.allbinary.servlet.file.DownloadFileServlet"
setmetatable(DownloadFileServlet, {__index = HttpServlet})

function DownloadFileServlet:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.DOWNLOAD = "download"
    self.DEFAULT_BUFFER_SIZE = 16384
end

function DownloadFileServlet._jinit(self)
    java_super_init(HttpServlet, self)
    DownloadFileServlet._init_fields(self)
    return self
end

function DownloadFileServlet.new()
    return DownloadFileServlet._jinit(setmetatable({}, DownloadFileServlet))
end


-- throws ServletException, IOException
function DownloadFileServlet:processRequest(request, response)
        local inputStream = nil
        local try_ok, try_error, try_value = pcall(function()
            BlisketServletUtil.getInstance():init(request)
            local requestPath = request:getRequestURI()
            if rawequal(requestPath, nil) then
                response:sendError(HttpServletResponse.SC_NOT_FOUND)
                do return "__jreturn" end
            end
            local beginIndex = ((string.find(requestPath, self.DOWNLOAD, 1, true) or 0) - 1)
            local filePath = StringUtil.getInstance().EMPTY_STRING
            if beginIndex >= 0 then
                filePath = string.sub(requestPath, (beginIndex + #self.DOWNLOAD) + 1)
            else
                response:sendError(HttpServletResponse.SC_NOT_FOUND)
            end
            local file = AbFile.createAbFile(require("allbinary_java").to_string(URLGLOBALS.getWebappPath()) .. require("allbinary_java").to_string(filePath))
            if not (file:exists()) then
                response:sendError(HttpServletResponse.SC_NOT_FOUND)
                do return "__jreturn" end
            end
            local hashMap = StdUtil.getInstance():createHashMap()
            local authenticationHelper = AuthenticationHelperFactory.new():getInstance(hashMap, request)
            if authenticationHelper:isAuthenticated() then
                if AuthenticationHelperUtil.getInstance():isAuthorized(authenticationHelper, filePath) then
                    inputStream = CloudStreamUtil.getInstance():getFile(file)
                    local contentType = self:getServletContext():getMimeType(file:getName())
                    if rawequal(contentType, nil) then
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
                    StreamUtil.getInstance():get(inputStream, response:getOutputStream(), java_typed_array("B", java_new_array(0, 16348)))
                else
                    response:sendError(HttpServletResponse.SC_UNAUTHORIZED, "You are not Authorized")
                end
            else
                response:sendError(HttpServletResponse.SC_UNAUTHORIZED, "Please Login")
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "processRequest()", e)
            end
            response:sendError(HttpServletResponse.SC_NOT_FOUND)
        end
        do -- finally
            StreamUtil.getInstance():close(response:getOutputStream())
            if not (StreamUtil.getInstance():close(inputStream)) then
            end
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(DownloadFileServlet, "processRequest", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "HttpServletRequest")) and (java_a2 == nil or java_is(java_a2, "HttpServletResponse")) end)


-- throws ServletException, IOException
function DownloadFileServlet:doGet(request, response)
        self:processRequest(request, response)
end
java_overload(DownloadFileServlet, "doGet", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "HttpServletRequest")) and (java_a2 == nil or java_is(java_a2, "HttpServletResponse")) end)


-- throws ServletException, IOException
function DownloadFileServlet:doPost(request, response)
        self:processRequest(request, response)
end
java_overload(DownloadFileServlet, "doPost", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "HttpServletRequest")) and (java_a2 == nil or java_is(java_a2, "HttpServletResponse")) end)


function DownloadFileServlet:getServletInfo()
        return "Serves Up Cloud Files"
end
java_overload(DownloadFileServlet, "getServletInfo", 0)

return DownloadFileServlet

