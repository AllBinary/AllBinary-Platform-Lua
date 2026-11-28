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
-- package org.allbinary.logic.io.file

local FileFactory = {}
package.loaded["org.allbinary.logic.io.file.FileFactory"] = FileFactory

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

local FileNotFoundException = java_lazy("java.io.FileNotFoundException")
local Context = java_lazy("android.content.Context")
local ResourceUtil = java_lazy("org.allbinary.data.resource.ResourceUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")

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

-- class table FileFactory is declared before the requires
FileFactory.__index = FileFactory
FileFactory.className = "FileFactory"
FileFactory.javaClassName = "org.allbinary.logic.io.file.FileFactory"

function FileFactory:_init_fields()
    if self.context == nil then self.context = nil end
end


function FileFactory._jinit(self, context)
    FileFactory._init_fields(self)
        self.context = context
    return self
end

function FileFactory.new(...)
    local self = setmetatable({}, FileFactory)
    FileFactory._jinit(self, ...)
    return self
end


function FileFactory.getInstance()
        return FileFactory.SINGLETON
end
FileFactory.getInstance__static = FileFactory.getInstance


-- throws Exception
function FileFactory:isFile(path)
        local try_ok, try_error, try_value = pcall(function()
            self.context:openFileInput(path)
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function FileFactory:getContext()
        return self.context
end


-- throws Exception
function FileFactory:getFile(filePath)
        return AbFile.createAbFileFromRawPath(filePath)
end


-- throws Exception
function FileFactory:getInstance(file, childFilePath)
        return AbFile.createAbFileWithChild(file, childFilePath)
end
FileFactory.getInstance__instance = FileFactory.getInstance
function FileFactory.getInstance(...)
                
    if select("#", ...) == 0 then return FileFactory.getInstance__static() end
                
    return FileFactory.getInstance__instance(...)
                
end

FileFactory.SINGLETON = FileFactory.new(ResourceUtil.getInstance():getContext())

return FileFactory

