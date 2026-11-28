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

local MagicalImageServlet = {}
package.loaded["org.allbinary.servlet.MagicalImageServlet"] = MagicalImageServlet

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

local ByteArrayOutputStream = java_lazy("java.io.ByteArrayOutputStream")
-- local IOException = require("java.io.IOException")
local InputStream = java_lazy("java.io.InputStream")
-- local ServletException = require("javax.servlet.ServletException")
-- local HttpServlet = require("javax.servlet.http.HttpServlet")
-- local HttpServletRequest = require("javax.servlet.http.HttpServletRequest")
-- local HttpServletResponse = require("javax.servlet.http.HttpServletResponse")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CloudStreamUtil = java_lazy("org.allbinary.logic.io.CloudStreamUtil")
local StreamUtil = java_lazy("org.allbinary.logic.io.StreamUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local BlisketServletUtil = java_lazy("org.allbinary.servlet.BlisketServletUtil")

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

-- class table MagicalImageServlet is declared before the requires
MagicalImageServlet.__index = MagicalImageServlet
MagicalImageServlet.className = "MagicalImageServlet"
MagicalImageServlet.javaClassName = "org.allbinary.servlet.MagicalImageServlet"
setmetatable(MagicalImageServlet, {__index = HttpServlet})

function MagicalImageServlet:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
end

function MagicalImageServlet._jinit(self)
    java_super_init(HttpServlet, self)
    MagicalImageServlet._init_fields(self)
    return self
end

function MagicalImageServlet.new()
    return MagicalImageServlet._jinit(setmetatable({}, MagicalImageServlet))
end


-- throws ServletException, IOException
function MagicalImageServlet:processRequest(request, response)
        local inputStream = nil
        local try_ok, try_error, try_value = pcall(function()
            BlisketServletUtil.getInstance():init(request)
            local requestURI = request:getRequestURI()
            local file = AbFile.createAbFile(require("allbinary_java").to_string(URLGLOBALS.getWebappPath()) .. require("allbinary_java").to_string(requestURI))
            inputStream = CloudStreamUtil.getInstance():getFileAnyWhere(file)
            local outputStream = require("java.io.ByteArrayOutputStream").new(8000)
            local byteArray = StreamUtil.getInstance():getByteArray(inputStream, outputStream, java_typed_array("B", java_new_array(0, 16384)))
            response:setContentType("image/jpeg;charset=utf-8")
            response:getOutputStream():write(byteArray)
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEWERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "processRequest()", e)
            end
        end
        do -- finally
            StreamUtil.getInstance():close(response:getOutputStream())
            if not (StreamUtil.getInstance():close(inputStream)) then
                response:sendError(HttpServletResponse.SC_NOT_FOUND)
            end
        end
end
java_overload(MagicalImageServlet, "processRequest", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "HttpServletRequest")) and (java_a2 == nil or java_is(java_a2, "HttpServletResponse")) end)


-- throws ServletException, IOException
function MagicalImageServlet:doGet(request, response)
        self:processRequest(request, response)
end
java_overload(MagicalImageServlet, "doGet", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "HttpServletRequest")) and (java_a2 == nil or java_is(java_a2, "HttpServletResponse")) end)


-- throws ServletException, IOException
function MagicalImageServlet:doPost(request, response)
        self:processRequest(request, response)
end
java_overload(MagicalImageServlet, "doPost", 2, function(java_a1, java_a2) return true and (java_a1 == nil or java_is(java_a1, "HttpServletRequest")) and (java_a2 == nil or java_is(java_a2, "HttpServletResponse")) end)


function MagicalImageServlet:getServletInfo()
        return "Serves Up Image From Local or Cloud"
end
java_overload(MagicalImageServlet, "getServletInfo", 0)

return MagicalImageServlet

