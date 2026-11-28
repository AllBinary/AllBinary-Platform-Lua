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
-- package org.allbinary.logic.system.loader

local AbeClassLoader = {}
package.loaded["org.allbinary.logic.system.loader.AbeClassLoader"] = AbeClassLoader

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

local FileInputStream = java_lazy("java.io.FileInputStream")
-- local IOException = require("java.io.IOException")
-- local Map = require("java.util.Map")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogBuffer = java_lazy("org.allbinary.logic.communication.log.LogBuffer")
local LogFactory = java_lazy("org.allbinary.logic.communication.log.LogFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StreamUtil = java_lazy("org.allbinary.logic.io.StreamUtil")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local AbCryptUtil = java_lazy("org.allbinary.logic.system.security.AbCryptUtil")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local ClassLoader = require("java.lang.ClassLoader")

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

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
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

local function java_super(class, name, count)
    local mangled = name .. "_j" .. count
    local current = class
    while type(current) == "table" do
        local method = rawget(current, mangled)
        if method ~= nil then return method end
        method = rawget(current, name)
        if method ~= nil and method ~= rawget(current, name .. "__jdispatcher") then return method end
        local parent = getmetatable(current)
        local index = parent and parent.__index
        if index == current then index = nil end
        current = index
    end
    return class[name]
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

-- class table AbeClassLoader is declared before the requires
AbeClassLoader.__index = AbeClassLoader
AbeClassLoader.className = "AbeClassLoader"
AbeClassLoader.javaClassName = "org.allbinary.logic.system.loader.AbeClassLoader"
setmetatable(AbeClassLoader, {__index = ClassLoader})

function AbeClassLoader:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abCryptUtil = AbCryptUtil.getInstance()
    self.LOAD_CLASS = "loadClass"
    self.ENCRYPTED_EXTENSION = require("allbinary_java").to_string(AbPathData.getInstance().EXTENSION_SEP) .. require("allbinary_java").to_string("abc")
    if self.key == nil then self.key = nil end
end


function AbeClassLoader._jinit(self, parent, key)
    java_super_init(ClassLoader, self, parent)
    AbeClassLoader._init_fields(self)
        -- super(...) made self above
        self.key = key
        AbeClassLoader.PATH = require("allbinary_java").to_string(URLGLOBALS.getWebappPath()) .. require("allbinary_java").to_string("WEB-INF/classes/")
    return self
end

function AbeClassLoader.new(...)
    local self = setmetatable({}, AbeClassLoader)
    AbeClassLoader._jinit(self, ...)
    return self
end


function AbeClassLoader:findLoadedClass1(name)
        return AbeClassLoader.classes:get(name)
end
java_overload(AbeClassLoader, "findLoadedClass1", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


-- throws ClassNotFoundException
function AbeClassLoader:loadClass_j1(name)
        return self:loadClass(name, false)
end


-- throws ClassNotFoundException
function AbeClassLoader:loadClass_j2(name, resolve)
        local loadedWith = "findLoadedClass1"
        local logBuffer = LogBuffer.new()
        local try_ok, try_error, try_value = pcall(function()
            local myClass = self:findLoadedClass1(name)
            if rawequal(myClass, nil) then
                local try_ok, try_error, try_value = pcall(function()
                    loadedWith = "super.loadClass"
                    local normalClass = java_super(ClassLoader, "loadClass", 2)(self, name, resolve)
                    if not rawequal(normalClass, nil) then
                        do return "__jreturn", normalClass end
                    end
                end)
                if not try_ok then
                    local e = try_error
                    if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                    logBuffer:add(LogFactory.getInstance(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Failed to Load Class: ") .. require("allbinary_java").to_string(name)) .. require("allbinary_java").to_string("\nwith: ")) .. require("allbinary_java").to_string(loadedWith), self, self.LOAD_CLASS, e))
                end
                if try_ok and try_error == "__jreturn" then return try_error, try_value end
                local classBytes = self:loadClassBytesFromFile(name)
                if rawequal(classBytes, nil) then
                    error(require("java.lang.ClassNotFoundException").new(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("My Bytes not loaded for: ") .. require("allbinary_java").to_string(name)) .. require("allbinary_java").to_string("\nwith: ")) .. require("allbinary_java").to_string("loadClassBytes")), 0)
                end
                myClass = self:defineClass(name, classBytes, 0, (classBytes.n or #classBytes))
                if rawequal(myClass, nil) then
                    error(require("java.lang.ClassNotFoundException").new(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("My Class Not Defineable for: ") .. require("allbinary_java").to_string(name)) .. require("allbinary_java").to_string("\nwith: ")) .. require("allbinary_java").to_string("loadClassBytes")), 0)
                end
                AbeClassLoader.classes:put(name, myClass)
            else
                logBuffer:add(LogFactory.getInstanceF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Already Loaded: ") .. require("allbinary_java").to_string(name)) .. require("allbinary_java").to_string("\nwith: ")) .. require("allbinary_java").to_string(loadedWith), self, self.LOAD_CLASS))
            end
            self:resolveClass(myClass)
            do return "__jreturn", myClass end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().LOADERERROR) then
                logBuffer:logAll()
                self.logUtil:put(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Failure loading: ") .. require("allbinary_java").to_string(name)) .. require("allbinary_java").to_string("\nwith: ")) .. require("allbinary_java").to_string(loadedWith), self, self.LOAD_CLASS, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function AbeClassLoader:loadClass(...)
    local count = select("#", ...)
    if count == 1 then return self:loadClass_j1(...) end
    if count == 2 then return self:loadClass_j2(...) end
    local parent = getmetatable(AbeClassLoader).__index
    if parent.loadClass then return parent.loadClass(self, ...) end
    error("No method loadClass takes " .. count .. " arguments")
end
AbeClassLoader.loadClass__jdispatcher = AbeClassLoader.loadClass


function AbeClassLoader:loadClassBytesFromFile(name)
        local in_ = nil
        local cname = StringUtil.getInstance().EMPTY_STRING
        local try_ok, try_error, try_value = pcall(function()
            cname = require("allbinary_java").to_string(require("allbinary_java").to_string(AbeClassLoader.PATH) .. require("allbinary_java").to_string(name:replace(".", AbPathData.getInstance().SEPARATORCHAR))) .. require("allbinary_java").to_string(self.ENCRYPTED_EXTENSION)
            in_ = FileInputStream.new(cname)
            local decrypted = self.abCryptUtil:decrypt(in_, self.key)
            do return "__jreturn", decrypted end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().LOADERERROR) then
                self.logUtil:put(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("(Before LogBuffer Output) Failure loading Encrypted: ") .. require("allbinary_java").to_string(name)) .. require("allbinary_java").to_string(" File: ")) .. require("allbinary_java").to_string(cname), "AbeClassLoader", "loadClassBytes", e)
            end
            StreamUtil.getInstance():close(in_)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
        return nil
end
java_overload(AbeClassLoader, "loadClassBytesFromFile", 1, function(java_a1) return true and (java_a1 == nil or type(java_a1) == "string") end)


-- throws ClassNotFoundException
function AbeClassLoader:oldLoadClass(name, resolve)
        local loadedWith = "findLoadedClass1"
        local try_ok, try_error, try_value = pcall(function()
            local myClass = self:findLoadedClass1(name)
            if rawequal(myClass, nil) then
                local try_ok, try_error, try_value = pcall(function()
                    loadedWith = "super.loadClass"
                    local normalClass = java_super(ClassLoader, "loadClass", 2)(self, name, resolve)
                    if not rawequal(normalClass, nil) then
                        do return "__jreturn", normalClass end
                    end
                end)
                if not try_ok then
                    local e = try_error
                    if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().LOADER) then
                        self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Failed Loaded Class: ") .. require("allbinary_java").to_string(name)) .. require("allbinary_java").to_string(" with: ")) .. require("allbinary_java").to_string(loadedWith), self, self.LOAD_CLASS)
                    end
                end
                if try_ok and try_error == "__jreturn" then return try_error, try_value end
                loadedWith = "loadClassBytes"
                local classBytes = self:loadClassBytesFromFile(name)
                if rawequal(classBytes, nil) then
                    error(require("java.lang.ClassNotFoundException").new(require("allbinary_java").to_string("Bytes not loaded for: ") .. require("allbinary_java").to_string(name)), 0)
                end
                myClass = self:defineClass(name, classBytes, 0, (classBytes.n or #classBytes))
                if rawequal(myClass, nil) then
                    error(require("java.lang.ClassNotFoundException").new(require("allbinary_java").to_string("Class Not Defineable for: ") .. require("allbinary_java").to_string(name)), 0)
                end
                AbeClassLoader.classes:put(name, myClass)
            else
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().LOADER) then
                    self.logUtil:putF(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("Already Loaded: ") .. require("allbinary_java").to_string(name)) .. require("allbinary_java").to_string(" with: ")) .. require("allbinary_java").to_string(loadedWith), self, self.LOAD_CLASS)
                end
            end
            self:resolveClass(myClass)
            do return "__jreturn", myClass end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().LOADERERROR) then
                self.logUtil:put(require("allbinary_java").to_string("Failure loading: ") .. require("allbinary_java").to_string(name), "AbeClassLoader", self.LOAD_CLASS, e)
            end
            return nil
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(AbeClassLoader, "oldLoadClass", 2, function(java_a1, java_a2) return true and (java_a1 == nil or type(java_a1) == "string") and type(java_a2) == "boolean" end)

AbeClassLoader.classes = StdUtil.getInstance():createHashMap()
AbeClassLoader.PATH = nil

return AbeClassLoader

